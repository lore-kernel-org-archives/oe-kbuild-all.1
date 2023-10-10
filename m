Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C115AC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjdyJO0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696928527; x=1728464527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/9cxbyllmC5lhJ4PMb+5NyqJcQQAvpFiREXgJ3Ybhk=;
  b=KjdyJO0nFqGXgRU/D25fDFPKgbs0IVB+uM/xvCmAaCkWDG62Ag+fkVRC
   virfpXnr5rpj4xAemmGsznbcS5q5Yh6EP1P6As0vIjY6W10nRugwXFs5T
   Z9qYMhOJj2Ub0HhZ9AvpggAC6pO9WMR7xvRsJqk3Xzw4Dv18r4Q4Vyin0
   50UmrUjSzvFPqquPY9LO6Ot6Y7NRBx+ftFwYmGFYVxYL8Z6odfDP2AlUP
   FEeO/2InPUlASnjgeZ3toopwPDdvAzLWH7w8J4eh2Zu83m6CpYAmbQplA
   PcUkjUiwfyB6PUiibT/U/QgIGbQQPwWNP3cugbaOzYNzRsNyKCrEf0cTc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364640363"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="364640363"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 02:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="757044502"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="757044502"
Received: from yujie-x299.sh.intel.com ([10.239.159.77])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 02:02:05 -0700
From: Yujie Liu <yujie.liu@intel.com>
To: LKP Developer <lkp-developer@eclists.intel.com>,
	Philip Li <philip.li@intel.com>
Cc: Yujie Liu <yujie.liu@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH kernel-tests 4/4] lib/checkpatch.sh: set finally_email_out to send out report
Date: Tue, 10 Oct 2023 16:57:13 +0800
Message-Id: <20231010085713.2187549-4-yujie.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010085713.2187549-1-yujie.liu@intel.com>
References: <20231010085713.2187549-1-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== fix issue ==

Subject: [0day-trouble-maker:qa-system-test-checkpatch-5cb27d30fc3a281e830a2099d520b469e2b82008
 1/1] checkpatch: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not
 preferred. Consider using octal permissions '0644'.
Message-ID: <202310101418.7qw45u1I-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="iI9uoeB3EPjtZ8AP"
Content-Disposition: inline

CONFUSED
BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mariusz Bialonczyk <manio@skyboo.net>

Link: https://jira.devtools.intel.com/browse/ZDAYCI-18319
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
 lib/checkpatch.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/checkpatch.sh b/lib/checkpatch.sh
index a2f3ad376..e490dfca3 100644
--- a/lib/checkpatch.sh
+++ b/lib/checkpatch.sh
@@ -44,6 +44,7 @@ email_checkpatch()
 
 	# MANUAL_CHECK=()
 	# set_manual_check "checkpatch"
+	local finally_email_out=1
 
 	local report_message_id="$(date +'%Y%m%d%H%S').$(mktemp --dry-run XXXXXXXX)-lkp@intel.com"
 
-- 
2.34.1

