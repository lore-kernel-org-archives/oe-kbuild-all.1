Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D6E51C51
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669147; cv=none; b=UVEaf++8X2O0KI/mrHP3Nu2V0ruRn1ZleXMkxtGfUl+NofsDVHk1Uf9ILcYurAKDPnTEeXhFSOC3erTBqZUv572vMwqd2gYr1Zhv3IFNg01EkJwkAwpJ307bF/460D23TJPu55l8W9nXCEE/+SrURZDps9rigwLPKKKW7og3AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669147; c=relaxed/simple;
	bh=YpmJGXZOBTbVX/5WlQIuqyYaYOZi7bO6T+1xRd2oqa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMN6LoQOdAAsgymLU5Hc1or+XEY9EyjhrEzYYSAspMGeI14ocNk4dFvgocJJlB1usd3/Kn9gMDb5S9gDxPKe8VePW7M7JBTjw9gz7BfJfBnsvni8p4e+XB0+F83aE9gqgfi67GaMBLdWQO4h7fYpmhXOcF8uZaJv4KXVYCg3tZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lg4HkITb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lg4HkITb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705669146; x=1737205146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpmJGXZOBTbVX/5WlQIuqyYaYOZi7bO6T+1xRd2oqa4=;
  b=Lg4HkITb/YSOGQzp7MpiuSzuNBlJWcKwN1ptUAlwyuP8JU0vQQpT1jxZ
   HqFWO05bD8q1iAYI4FziV2QN3auG3HOXo1JsFqbBZq1/Ie2YK0DL1AEVd
   Np0Rg9FaeXaHl8o8P/00Pfw2X4NfbYLrrxvfAHjIAz+d2SV2rIAoW2hn6
   CBmylH8Xy99eZe6gxnXJmxPYTxkzWLNMsSAJ8eBT4HwFxzbju2Jl6x1H6
   8gy0YhLK+TG4AZWDsBzwr1oBTILbGg8G+0/z02pzyLUzT3r5vua696NKt
   ShItx9wIo5EFZKdOUDnmRV9PcJ9nDL3w528wuZgGk5MVPP42YTMIo5+Uc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7439995"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7439995"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 04:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="785067920"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="785067920"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2024 04:59:00 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQoSY-00043k-1u;
	Fri, 19 Jan 2024 12:58:58 +0000
Date: Fri, 19 Jan 2024 20:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <markpearson@lenovo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: drivers/platform/x86/think-lmi.c:758:51: warning: '%s' directive
 argument is null
Message-ID: <202401192058.imSFFV22-lkp@intel.com>
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
head:   9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
commit: b49f72e7f96d4ed147447428f2ae5b4cea598ca7 platform/x86: think-lmi: Certificate authentication support
date:   1 year, 10 months ago
config: x86_64-randconfig-x063-20230716 (https://download.01.org/0day-ci/archive/20240119/202401192058.imSFFV22-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192058.imSFFV22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192058.imSFFV22-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/think-lmi.c: In function 'certificate_store':
>> drivers/platform/x86/think-lmi.c:758:51: warning: '%s' directive argument is null [-Wformat-overflow=]
     758 |                 auth_str = kasprintf(GFP_KERNEL, "%s,%s",
         |                                                   ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


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
