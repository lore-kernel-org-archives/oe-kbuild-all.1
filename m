Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A91343203
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766063651; cv=none; b=SU7reBv+K8x6gTyhz3Q255/ozU61M0ChTFEkrKw6buYrQQu5+ZBln8sdsc7hgnH8C3CtqcPrW8rLKBmMKDHsSOJLS0d2W1sZ7sGe7ydCXhQZdyc/Z9NAkSSWViTWhT3PKg/WslTw/Mgyo+8/0xhdIYRPc5rT3VExfvHsuzpoLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766063651; c=relaxed/simple;
	bh=3coktnMEWxyaQxh4KtFRnkUImBtLDm1o/SUAVBShHM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dds8YRNYZwJqU/h9RFKizZDIL5Pivl2/dVmSLPxQgo6AfSbc/ybyxHee6hBtiTNlcNlpr9SotBvROxAQChR6Ju+f7C97JxpoOBBchrkC3Z23Z0ENAzGw/aVkIH3DX9DNao+4QBCQlCkeElNZwD/vJC+yI19qmlByfll9ifLD/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+IxXcAZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+IxXcAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766063650; x=1797599650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3coktnMEWxyaQxh4KtFRnkUImBtLDm1o/SUAVBShHM0=;
  b=l+IxXcAZVL0RNALd5EDP2utAQaSJPOqIxH5Hi8Ftox6FRtYnliuFlVSf
   wPUxntnU92wXL1Us756bCf8agIMmDeQ3jmCbmgYucQt9e6M2Q8jqx9I8k
   cvng1cG5KH/wRgi8FS4fj1wG0MMk571ny+OfvN6CLi14uXbuKp9X3OoY9
   ChXhq1OEPFW6nXTd+efITl/KKjQxJIx0u8tpgjuAYwDPC0rlX+Q1C+GUa
   iGxvtw+vJlVVmp4+I5baZgWNoEtu1EN/xP40Aqs0zy8B80cUN1QT9XQcB
   XFUzeG5BCEsPZvWNXdg8TwvHg5NNfVdIXs8WP2U6kVv1qpdkxaKhnkLb0
   Q==;
X-CSE-ConnectionGUID: 8cbJ/D3AQkWXJKYHtmNlCg==
X-CSE-MsgGUID: +Yu/2fz9TiiZ+QnlcJwo0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68055031"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68055031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:14:06 -0800
X-CSE-ConnectionGUID: MHTDp1SfQ/yDgoD48yctJA==
X-CSE-MsgGUID: 6k1UT+6SRT6hlqP3gcpncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203478944"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2025 05:14:04 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWDpS-00000000283-0RUR;
	Thu, 18 Dec 2025 13:14:02 +0000
Date: Thu, 18 Dec 2025 21:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:6.6-velinux 87/87]
 security/integrity/ima/ima_queue.c:218:1: warning: label 'try_add_ima_entry'
 defined but not used
Message-ID: <202512182112.dFUFExFT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   8ba291f6d44d3336d9ef45cc81cf3f5a000bf246
commit: a5f2c036d5b2b8c2ac0eebaa11a6c8999f1bcd95 [87/87] bytedance: ima: fix UAF issue after ima_tdx_extend failed.
config: x86_64-bytedance-6.6-velinux-kselftests (https://download.01.org/0day-ci/archive/20251218/202512182112.dFUFExFT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512182112.dFUFExFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182112.dFUFExFT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/integrity/ima/ima_queue.c: In function 'ima_add_template_entry':
>> security/integrity/ima/ima_queue.c:218:1: warning: label 'try_add_ima_entry' defined but not used [-Wunused-label]
     218 | try_add_ima_entry:
         | ^~~~~~~~~~~~~~~~~


vim +/try_add_ima_entry +218 security/integrity/ima/ima_queue.c

   209	
   210		tpmresult = ima_pcr_extend(digests_arg, entry->pcr);
   211		if (tpmresult != 0) {
   212			snprintf(tpm_audit_cause, AUDIT_CAUSE_LEN_MAX, "TPM_error(%d)",
   213				 tpmresult);
   214			audit_cause = tpm_audit_cause;
   215			audit_info = 0;
   216		}
   217	
 > 218	try_add_ima_entry:
   219		if (!tpmresult) {
   220			/* Allocate memory in advance and it won't fail. */
   221			ima_add_digest_entry(entry,
   222					     !IS_ENABLED(CONFIG_IMA_DISABLE_HTABLE), qe);
   223		} else {
   224			kfree(qe);
   225		}
   226	
   227	out:
   228		mutex_unlock(&ima_extend_list_mutex);
   229		integrity_audit_msg(AUDIT_INTEGRITY_PCR, inode, filename,
   230				    op, audit_cause, result, audit_info);
   231		return result;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
