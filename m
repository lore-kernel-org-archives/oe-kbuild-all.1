Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D851B621
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 01:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692927991; x=1724463991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t+qlbKtn14VPjOiNpJOYAOipfVCPSt4z4wBBXovjpBM=;
  b=IW8Z3WCJ9w6zh9Lc7Pymurdp2HNYBYjmaiignEjjZCA/V+r1fQ9KyMgH
   nv1ruxB84tNsnMy0xVAgFGKmiFS38g0puSs4wKi85+tBs/6s0pT/fHj4G
   +wCLX8JBHLFyjJJdThSJiNwKb5ndYdN1tHKdUFoq4Gzkh8DHK+lrM205a
   hcsbsg5EWuiPjRU5O97lnjrNYpYXuepGD3fpunAM7y0lmojDiUYY8gyWW
   N94N/qPRYSMelXDjPUgaW2uUitY4K1GQp7j325A9uVwk1oKQIVUtf9/ue
   3SARiUItf6VA9ECHGTK258zQJC0fRWbSdS6eIBH5aIL0yYbE3ZFn3YM3Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="460968719"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="460968719"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687119778"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="687119778"
Received: from aruby-mobl.amr.corp.intel.com (HELO rpedgeco-desk4.intel.com) ([10.251.25.72])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:46:29 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: lkp@intel.com
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	keescook@chromium.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	rick.p.edgecombe@intel.com,
	x86@kernel.org,
	yu-cheng.yu@intel.com
Subject: [PATCH] x86/shstk: Change order of __user in type
Date: Thu, 24 Aug 2023 18:45:54 -0700
Message-Id: <20230825014554.1769194-1-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202308222312.Jt4Tog5T-lkp@intel.com>
References: <202308222312.Jt4Tog5T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0day reports a sparse warning:
arch/x86/kernel/shstk.c:295:55: sparse: sparse: cast removes address space
'__user' of expression

The __user is in the wrong spot. Move it to right spot and make sparse
happy.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308222312.Jt4Tog5T-lkp@intel.com/
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/kernel/shstk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index cd10d074a444..fd689921a1db 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -275,7 +275,7 @@ static int shstk_push_sigframe(unsigned long *ssp)
 		return -EINVAL;
 
 	*ssp -= SS_FRAME_SIZE;
-	if (put_shstk_data((void *__user)*ssp, target_ssp))
+	if (put_shstk_data((void __user *)*ssp, target_ssp))
 		return -EFAULT;
 
 	return 0;
-- 
2.34.1

