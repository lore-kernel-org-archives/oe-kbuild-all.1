Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A265F168C3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247250; cv=none; b=s0nFVnLR5Ji9pQhyS0Z/dBZVPwaWPn1Z5qHE2hccU6xMsdaLfqUevscdI50Lc0dbCtI/t2oQoVqtP/d1Fk1O9SlJglzzCu9GbqGlkFQWw8a6642Xpso6NmPOGdmlmNUeuvkh0aofe2drMywPosgrr0jO3Dy/Wn0CZOOZk8VAeeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247250; c=relaxed/simple;
	bh=e2OLMStwJmN/C3WWd0wZz+IVZx+qvnkJHsAYV3V36VI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3+0a5rCaTZ8bdUhPeYhl/rqzcrsyQJFPJgCU3GSswFwlinLK9b+Bj/Dc6fClrNzbLKPr3nqzIA8792HySiUvn0vrXCMtFti6OVQjuf1oiEt1zqNS03CPnmVDkSiRcnqwWXwUqXJ+1fOEp7uuzt5N4Dge6p7MKnp4aDwPbjQMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Elkl8bjN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Elkl8bjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729247249; x=1760783249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2OLMStwJmN/C3WWd0wZz+IVZx+qvnkJHsAYV3V36VI=;
  b=Elkl8bjNdf6Ku+RHykaJHb+bvcd4gzRnicOdhHJ/s++YYYwqILcAqbXv
   6ZJT9ZkXSIIOOejyiv1XBeMfqrhD0rlQHiuQb6dxkxLoprt3RCEY/41QX
   mN5PmnOuKEbg1iJNBGaN0QQ1qI+W+OKqO79Lei/Wcrf+BBetoWkeeykMl
   AKmIxlEpdaWo5WMH698MmaXYXtiG3M3bjIm0Iapi8JesmpHjhqkW6zbvj
   iv15JbPdVcTbplEMnpfqXHjH2krcKAwUeO1bSwaM7avWGMMnm6c0/TVJ+
   9XQsizQK19R2RSMjpwohqLc3K49gpyDeVhjJ0Ma0PtMVRj2QjqQuGICuh
   w==;
X-CSE-ConnectionGUID: E/AgYsC/S4iK25oGLQKxCw==
X-CSE-MsgGUID: Wmif1721RBq2wCVlfjZrSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39901904"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39901904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 03:27:28 -0700
X-CSE-ConnectionGUID: AILjTkYlQJq7UwfinNTzBA==
X-CSE-MsgGUID: Fbe40MW7QF2b5gD+TmswTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78843927"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2024 03:27:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1kCa-000New-0Q;
	Fri, 18 Oct 2024 10:27:24 +0000
Date: Fri, 18 Oct 2024 18:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 4885/17818] drivers/opp/of.c:1081:28:
 warning: multiple unsequenced modifications to 'val'
Message-ID: <202410181835.LOqFY2u8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   096cd0432b03805f49c86684dafb9ced4511a714
commit: bfeefbb7cc6feae6ff295bfb93a3079dfce4d709 [4885/17818] OPP: Add dev_pm_opp_add_dynamic() to allow more flexibility
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241018/202410181835.LOqFY2u8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181835.LOqFY2u8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181835.LOqFY2u8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/of.c:1081:28: warning: multiple unsequenced modifications to 'val' [-Wunsequenced]
    1081 |                         .freq = be32_to_cpup(val++) * 1000,
         |                                                 ^
    1082 |                         .u_volt = be32_to_cpup(val++),
         |                                                   ~~
   1 warning generated.


vim +/val +1081 drivers/opp/of.c

  1039	
  1040	/* Initializes OPP tables based on old-deprecated bindings */
  1041	static int _of_add_opp_table_v1(struct device *dev, struct opp_table *opp_table)
  1042	{
  1043		const struct property *prop;
  1044		const __be32 *val;
  1045		int nr, ret = 0;
  1046	
  1047		mutex_lock(&opp_table->lock);
  1048		if (opp_table->parsed_static_opps) {
  1049			opp_table->parsed_static_opps++;
  1050			mutex_unlock(&opp_table->lock);
  1051			return 0;
  1052		}
  1053	
  1054		opp_table->parsed_static_opps = 1;
  1055		mutex_unlock(&opp_table->lock);
  1056	
  1057		prop = of_find_property(dev->of_node, "operating-points", NULL);
  1058		if (!prop) {
  1059			ret = -ENODEV;
  1060			goto remove_static_opp;
  1061		}
  1062		if (!prop->value) {
  1063			ret = -ENODATA;
  1064			goto remove_static_opp;
  1065		}
  1066	
  1067		/*
  1068		 * Each OPP is a set of tuples consisting of frequency and
  1069		 * voltage like <freq-kHz vol-uV>.
  1070		 */
  1071		nr = prop->length / sizeof(u32);
  1072		if (nr % 2) {
  1073			dev_err(dev, "%s: Invalid OPP table\n", __func__);
  1074			ret = -EINVAL;
  1075			goto remove_static_opp;
  1076		}
  1077	
  1078		val = prop->value;
  1079		while (nr) {
  1080			struct dev_pm_opp_data data = {
> 1081				.freq = be32_to_cpup(val++) * 1000,
  1082				.u_volt = be32_to_cpup(val++),
  1083			};
  1084	
  1085			ret = _opp_add_v1(opp_table, dev, &data, false);
  1086			if (ret) {
  1087				dev_err(dev, "%s: Failed to add OPP %ld (%d)\n",
  1088					__func__, data.freq, ret);
  1089				goto remove_static_opp;
  1090			}
  1091			nr -= 2;
  1092		}
  1093	
  1094		return 0;
  1095	
  1096	remove_static_opp:
  1097		_opp_remove_all_static(opp_table);
  1098	
  1099		return ret;
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
