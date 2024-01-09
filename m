Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF73E47E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rr96HTAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704840394; x=1736376394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w6kupFrzbFpocVDLGUNde4MWMYhkpk7yL5N6258QRUQ=;
  b=Rr96HTAeo5Pndk50dodXSbUQvxjnXe0feZkgACHQfdeckDGsqpLGdxzr
   oVjZqjua8XvtSXGy7L7dq0nQ5FTmmJ/nX9TyDYO5RMgLEEoSiq9VCT9me
   +02+hnnAJY6ajM7fzowRtlLD2MusumgcweiZcc6SJM+qrcnkV1ig9uBrF
   Bq/gQTiL85qEmH5pUX0NRbixtnadQGk35ACfFPYLnAv8Z/PYKt7jYHVJN
   guzKGB/01+ck2i1kCr6kdUcZcT31GCEh756CkzMRmX+DVQ2Knd8pXb1d9
   A1jtZyoxwX71QmxZP4UoUEZvEEd0tmvcXOSA9rEq7iirFgQ0BmZClS4Oy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5116936"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5116936"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 14:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872397599"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="872397599"
Received: from rflores-mobl.amr.corp.intel.com (HELO rpedgeco-desk4.intel.com) ([10.255.229.33])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 14:46:29 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: lkp@intel.com,
	x86@kernel.org
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	keescook@chromium.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	rick.p.edgecombe@intel.com,
	yu-cheng.yu@intel.com
Subject: [PATCH] x86/shstk: Use __force when casting away __user
Date: Tue,  9 Jan 2024 14:46:19 -0800
Message-Id: <20240109224619.1013899-1-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202401080003.duO4RmjK-lkp@intel.com>
References: <202401080003.duO4RmjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In setup_signal_shadow_stack() the kernel needs to push the restorer
address to the shadow stack. This involves writing the value of the
restorer pointer to the shadow stack. Since the restorer is defined as a
__user in struct k_sigaction, the __user needs to be casted away to read
the value. It is safe to do, because nothing is being dereferenced, and
the de-__user-ed value is not stashed in an accessible local variable
where it might accidentally be used for another purpose.

However, sparse warns about casting away __user. So use __force to
silence sparse and add a comment to explain why it is ok.

Fixes: 05e36022c054 ("x86/shstk: Handle signals for shadow stack")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401080003.duO4RmjK-lkp@intel.com/
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/kernel/shstk.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 59e15dd8d0f8..7cc294482011 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -367,7 +367,11 @@ int setup_signal_shadow_stack(struct ksignal *ksig)
 
 	/* Push restorer address */
 	ssp -= SS_FRAME_SIZE;
-	err = write_user_shstk_64((u64 __user *)ssp, (u64)restorer);
+	/*
+	 * Use __force because this is just writing the address of the pointer
+	 * to the shadow stack, not dereferencing it.
+	 */
+	err = write_user_shstk_64((u64 __user *)ssp, (u64 __force)restorer);
 	if (unlikely(err))
 		return -EFAULT;
 
-- 
2.34.1

