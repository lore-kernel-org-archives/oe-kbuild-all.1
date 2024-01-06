Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5E79C3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5TazfPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704543761; x=1736079761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JC3Recyvm8UtK2EeAXCDyJ1RC0luwY7yqJ9jL/N9RUM=;
  b=L5TazfPDqal6s72/XkZq1TKRybJYasbkyHjSZuCqLvBanln2/SkXjInk
   5IRsqhjTvYB+EoiQQipDYVnp9CRSlyDqv/Nrcq6r6APvVTvRrPUTVwT8f
   dwqXpd7bwNavB1Xr2OmmxBIum01cSyNhHU02PIFcQVoGtcP36dtQK2VLd
   Dv3gU6Ob2EK2Q+5yz9fvMhSLfzd3PsrnDH5xYPCtwFWR1TfqwEagEAMIz
   pMxsc3sOrwpsFnQrjYMP54tz5+++aEpicXFi8p6/62h5lt9/gMr+f3i8+
   nmWthwg6ByEZZp1DegqlNlmorVg+r6jlhSNy5CRsS99efsiaihq0vkc89
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="377802098"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="377802098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 04:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="784437565"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="784437565"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2024 04:22:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM5hG-0002TU-0H;
	Sat, 06 Jan 2024 12:22:38 +0000
Date: Sat, 6 Jan 2024 20:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] platform/x86: Lenovo sub directory
Message-ID: <202401062013.zH6RkQ8p-lkp@intel.com>
References: <20240104003726.21277-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104003726.21277-1-mpearson-lenovo@squebb.ca>

Hi Mark,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc8 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Lenovo-sub-directory/20240104-084032
base:   linus/master
patch link:    https://lore.kernel.org/r/20240104003726.21277-1-mpearson-lenovo%40squebb.ca
patch subject: [PATCH RFC] platform/x86: Lenovo sub directory
config: i386-buildonly-randconfig-003-20240106 (https://download.01.org/0day-ci/archive/20240106/202401062013.zH6RkQ8p-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401062013.zH6RkQ8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401062013.zH6RkQ8p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/platform/x86/lenovo/ibm_rtl.o', needed by 'drivers/platform/x86/lenovo/'.
>> make[7]: *** No rule to make target 'drivers/platform/x86/lenovo/hdaps.o', needed by 'drivers/platform/x86/lenovo/'.
   make[7]: Target 'drivers/platform/x86/lenovo/' not remade because of errors.
--
   drivers/platform/x86/lenovo/think-lmi.c: In function 'certificate_store':
>> drivers/platform/x86/lenovo/think-lmi.c:744:14: warning: '%s' directive argument is null [-Wformat-overflow=]
     744 |   auth_str = kasprintf(GFP_KERNEL, "%s,%s",
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     745 |     dmi_get_system_info(DMI_PRODUCT_SERIAL),
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     746 |     setting->signature);
         |     ~~~~~~~~~~~~~~~~~~~


vim +744 drivers/platform/x86/lenovo/think-lmi.c

b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  721  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  722  static ssize_t certificate_store(struct kobject *kobj,
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  723  				  struct kobj_attribute *attr,
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  724  				  const char *buf, size_t count)
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  725  {
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  726  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  727  	char *auth_str, *new_cert;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  728  	char *guid;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  729  	int ret;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  730  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  731  	if (!capable(CAP_SYS_ADMIN))
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  732  		return -EPERM;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  733  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  734  	if (!tlmi_priv.certificate_support)
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  735  		return -EOPNOTSUPP;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  736  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  737  	/* If empty then clear installed certificate */
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  738  	if ((buf[0] == '\0') || (buf[0] == '\n')) { /* Clear installed certificate */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  739  		/* Check that signature is set */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  740  		if (!setting->signature || !setting->signature[0])
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  741  			return -EACCES;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  742  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  743  		/* Format: 'serial#, signature' */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17 @744  		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  745  				dmi_get_system_info(DMI_PRODUCT_SERIAL),
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  746  				setting->signature);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  747  		if (!auth_str)
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  748  			return -ENOMEM;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  749  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  750  		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  751  		kfree(auth_str);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  752  
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  753  		return ret ?: count;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  754  	}
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  755  
e621198016e99c drivers/platform/x86/think-lmi.c Andy Shevchenko 2023-09-18  756  	/* Strip out CR if one is present */
e621198016e99c drivers/platform/x86/think-lmi.c Andy Shevchenko 2023-09-18  757  	new_cert = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  758  	if (!new_cert)
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  759  		return -ENOMEM;
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  760  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  761  	if (setting->cert_installed) {
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  762  		/* Certificate is installed so this is an update */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  763  		if (!setting->signature || !setting->signature[0]) {
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  764  			kfree(new_cert);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  765  			return -EACCES;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  766  		}
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  767  		guid = LENOVO_UPDATE_BIOS_CERT_GUID;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  768  		/* Format: 'Certificate,Signature' */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  769  		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  770  				new_cert, setting->signature);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  771  	} else {
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  772  		/* This is a fresh install */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  773  		if (!setting->valid || !setting->password[0]) {
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  774  			kfree(new_cert);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  775  			return -EACCES;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  776  		}
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  777  		guid = LENOVO_SET_BIOS_CERT_GUID;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  778  		/* Format: 'Certificate,Admin-password' */
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  779  		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  780  				new_cert, setting->password);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  781  	}
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  782  	kfree(new_cert);
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  783  	if (!auth_str)
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  784  		return -ENOMEM;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  785  
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  786  	ret = tlmi_simple_call(guid, auth_str);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  787  	kfree(auth_str);
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  788  
36560efeab3232 drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-21  789  	return ret ?: count;
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  790  }
b49f72e7f96d4e drivers/platform/x86/think-lmi.c Mark Pearson    2022-03-17  791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
