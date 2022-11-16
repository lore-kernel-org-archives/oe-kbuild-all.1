Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD27C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668559446; x=1700095446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tx19St9qzi0HfKCU80s71CDjOvtppRUy1zquC1kpDYM=;
  b=T+N9BQJWY0QFUkvMlhtOg5pF/MqciLw0MB+OmD254Ch+6gbAv7z+d+Az
   isWrsPyyLAMnQ0RB+28CBX61d+YlJxEV1ER3YKP2Xc1H592V39RzGlLb+
   scYWVYMNNBtVqSG9N+SnbNo/US2quFHbBRE+KerBT320f4cSRl64MSuD1
   qiAvlfgOhfQG0y249uaM3niQBKSyE6srMPB9U/hSrebeYgbpmHkMuSJ2I
   azCracNULhYBekXPSbyAT9GtXGUd+cJQkpvMII3fOVLl1YQgD7T7GQoIo
   yWSU5lIB4G3yRrMFKUrK9pZvY4wKrNwnsupn8HX9oMYki4csWnMmk6gF5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="311116304"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="311116304"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 16:44:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="968210385"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="968210385"
Received: from nrobin-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.45.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 16:44:01 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 23AB810446E; Wed, 16 Nov 2022 03:43:59 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: kirill@shutemov.name
Cc: dave.hansen@intel.com,
	dave.hansen@linux.intel.com,
	jejb@linux.ibm.com,
	kirill.shutemov@linux.intel.com,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	martin.petersen@oracle.com,
	oe-kbuild-all@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH 2/2] x86/mm: Fix sparse warnings in untagged_ptr()
Date: Wed, 16 Nov 2022 03:43:53 +0300
Message-Id: <20221116004353.15052-3-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221116004353.15052-1-kirill.shutemov@linux.intel.com>
References: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
 <20221116004353.15052-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linear Address Masking patchset triggered a lot of sparse warnings.

The root cause is that casting pointer to '__typeof__(*(ptr)) *' will
strip all sparse tags. The type has to be defined based on the pointer
type, not based on what the pointer points to.

Fix cast in untagged_ptr() and avoid __typeof__() usage in
get/put_user().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/x86/include/asm/uaccess.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 1d2c79246681..bd92e1ee1c1a 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -43,7 +43,7 @@ DECLARE_STATIC_KEY_FALSE(tagged_addr_key);
 #define untagged_ptr(mm, ptr)	({					\
 	u64 __ptrval = (__force u64)(ptr);				\
 	__ptrval = untagged_addr(mm, __ptrval);				\
-	(__force __typeof__(*(ptr)) *)__ptrval;				\
+	(__force __typeof__(ptr))__ptrval;				\
 })
 #else
 #define untagged_addr(mm, addr)	(addr)
@@ -158,10 +158,8 @@ extern int __get_user_bad(void);
  */
 #define get_user(x,ptr)							\
 ({									\
-	__typeof__(*(ptr)) __user *__ptr_clean;				\
-	__ptr_clean = untagged_ptr(current->mm, ptr);			\
 	might_fault();							\
-	do_get_user_call(get_user,x,__ptr_clean);			\
+	do_get_user_call(get_user,x,untagged_ptr(current->mm, ptr));	\
 })
 
 /**
@@ -263,10 +261,8 @@ extern void __put_user_nocheck_8(void);
  * Return: zero on success, or -EFAULT on error.
  */
 #define put_user(x, ptr) ({						\
-	__typeof__(*(ptr)) __user *__ptr_clean;				\
-	__ptr_clean = untagged_ptr(current->mm, ptr);			\
 	might_fault();							\
-	do_put_user_call(put_user,x,__ptr_clean);			\
+	do_put_user_call(put_user,x,untagged_ptr(current->mm, ptr));	\
 })
 
 /**
-- 
2.38.0

