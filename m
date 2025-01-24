Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD6B28F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 02:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737685952; cv=none; b=dNulX3PRwNF+9kXmfOrPUmGT9flpgvaNb7fIlFDvAz1UdjoaohkTae+GiVyFh2NMplvx12yWqcdeVdJtIBdnblR1XrMi5RFfjqU/DiS6kJtbYoIsb4m5ri/ZOI89iHIlNHK1UmpvHVwdkqL04cPGWdNCObHjSh02kcT7z4Ho/UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737685952; c=relaxed/simple;
	bh=LmDFR/ZwCUrZhI3dgT6Ur52udj3kvxhrsI3w+0j7C9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRcgmeiIBoXId70gBU4QQiqDd4LCMTtsCydgnNpJZV/Tlwm3bgzjQlbxP42yygvXjRL7dEaGbPFTVxv6151xbwCr1P9Fti50mH+o+0pgAcV8iy7svXQ1x8PzuY5Y5wlm3r5UzrOT5YXxZ+AbpdAoV5UjOxzm4dlnPw1VMiIKygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEvd8jH0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEvd8jH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737685951; x=1769221951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmDFR/ZwCUrZhI3dgT6Ur52udj3kvxhrsI3w+0j7C9w=;
  b=nEvd8jH0lNidqHLP3jPh5vPpSZg1Fxh5XSzoQR622NvBP4vb/GsUDEBy
   NGuIWlOfNEazELhjWb+4b+WPkC5l9vKxBg2kkTFmrOxvyTT3NxJxG8phq
   VfkANFPCzyMa7p4E50d4dKGuKdKsTP4BBC/gBiqt1DpUeg6il6Yxkw9wu
   Q3YjtpvXOghFsmDDrcjJwk0VONHqxsiWa0hLrUiJ0mFlQDSrJ6B6Vely1
   eRFf6XEyobLR/P+FLR3QPQe0MWKdawotnRtMBSrxM7hgpie0K7sjlmHbA
   On95CmeZNJh9dlNtE1YTJnmCHNp81WYi94E9Vl/pchSsWM/Zlod+5yJdS
   w==;
X-CSE-ConnectionGUID: 436LmaM9TxS7W5+fEzoCqQ==
X-CSE-MsgGUID: mLZPibWNTfayn2seEpLOBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48801398"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48801398"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:32:30 -0800
X-CSE-ConnectionGUID: VQHm92B0Rxe/Zxj4bhUL+Q==
X-CSE-MsgGUID: Yq9j1RrnSJmqLwO3ih7ezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107496633"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 18:32:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9Ug-000c2X-1Y;
	Fri, 24 Jan 2025 02:32:26 +0000
Date: Fri, 24 Jan 2025 10:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <markpearson@lenovo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: drivers/platform/x86/think-lmi.c:758:51: warning: '%s' directive
 argument is null
Message-ID: <202501241043.Mn4wJfgU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0b1f59142746f74476a03040f745329c8355a7e
commit: b49f72e7f96d4ed147447428f2ae5b4cea598ca7 platform/x86: think-lmi: Certificate authentication support
date:   2 years, 10 months ago
config: x86_64-randconfig-161-20230920 (https://download.01.org/0day-ci/archive/20250124/202501241043.Mn4wJfgU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241043.Mn4wJfgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241043.Mn4wJfgU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/think-lmi.c: In function 'certificate_store':
>> drivers/platform/x86/think-lmi.c:758:51: warning: '%s' directive argument is null [-Wformat-overflow=]
     758 |                 auth_str = kasprintf(GFP_KERNEL, "%s,%s",
         |                                                   ^~


vim +758 drivers/platform/x86/think-lmi.c

   727	
   728	static ssize_t certificate_store(struct kobject *kobj,
   729					  struct kobj_attribute *attr,
   730					  const char *buf, size_t count)
   731	{
   732		struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
   733		char *auth_str, *new_cert;
   734		char *guid;
   735		int ret;
   736	
   737		if (!capable(CAP_SYS_ADMIN))
   738			return -EPERM;
   739	
   740		if (!tlmi_priv.certificate_support)
   741			return -EOPNOTSUPP;
   742	
   743		new_cert = kstrdup(buf, GFP_KERNEL);
   744		if (!new_cert)
   745			return -ENOMEM;
   746		/* Strip out CR if one is present */
   747		strip_cr(new_cert);
   748	
   749		/* If empty then clear installed certificate */
   750		if (new_cert[0] == '\0') { /* Clear installed certificate */
   751			kfree(new_cert);
   752	
   753			/* Check that signature is set */
   754			if (!setting->signature || !setting->signature[0])
   755				return -EACCES;
   756	
   757			/* Format: 'serial#, signature' */
 > 758			auth_str = kasprintf(GFP_KERNEL, "%s,%s",
   759					dmi_get_system_info(DMI_PRODUCT_SERIAL),
   760					setting->signature);
   761			if (!auth_str)
   762				return -ENOMEM;
   763	
   764			ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
   765			kfree(auth_str);
   766			if (ret)
   767				return ret;
   768	
   769			kfree(setting->certificate);
   770			setting->certificate = NULL;
   771			return count;
   772		}
   773	
   774		if (setting->cert_installed) {
   775			/* Certificate is installed so this is an update */
   776			if (!setting->signature || !setting->signature[0]) {
   777				kfree(new_cert);
   778				return -EACCES;
   779			}
   780			guid = LENOVO_UPDATE_BIOS_CERT_GUID;
   781			/* Format: 'Certificate,Signature' */
   782			auth_str = kasprintf(GFP_KERNEL, "%s,%s",
   783					new_cert, setting->signature);
   784		} else {
   785			/* This is a fresh install */
   786			if (!setting->valid || !setting->password[0]) {
   787				kfree(new_cert);
   788				return -EACCES;
   789			}
   790			guid = LENOVO_SET_BIOS_CERT_GUID;
   791			/* Format: 'Certificate,Admin-password' */
   792			auth_str = kasprintf(GFP_KERNEL, "%s,%s",
   793					new_cert, setting->password);
   794		}
   795		if (!auth_str) {
   796			kfree(new_cert);
   797			return -ENOMEM;
   798		}
   799	
   800		ret = tlmi_simple_call(guid, auth_str);
   801		kfree(auth_str);
   802		if (ret) {
   803			kfree(new_cert);
   804			return ret;
   805		}
   806	
   807		kfree(setting->certificate);
   808		setting->certificate = new_cert;
   809		return count;
   810	}
   811	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
