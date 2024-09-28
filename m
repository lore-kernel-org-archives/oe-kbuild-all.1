Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157D14F119
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727516951; cv=none; b=KNb/PryAUXCmAuyO3Pdh59IFXzGT8Z5sZ68TpyBS3fBE159o8BDP6qIvJoQ5NXgmbjluuiHlouLB3Pq84NIpDIEkYCRfCeGvWzooxK89cDCNm5WFZjroD3z5hIvEH4DDGrQVv6mlcPh8xUnzUf9f9ZiZHtmU2bOhINJnvzJ/x6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727516951; c=relaxed/simple;
	bh=ZWEnLLCMV/Gv344yE7Rvhubbztg0vR8yypTrFpSKlcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqIiu1OiKwuB0YBfUBT0sODO5k/Aa2fFHvGiknIbKmtjfwdN2iYhFUx0dgHLCTrJ9uOhHUJzqFLEh412Ky99Wq5Ck+KLcBb5DkmpjgNA93jOqWqQ6scQ6cbniFHrEXikVtUPu2Ty+bD6U9jFgv0Y2eeRR/fTacNLr10YAjnca+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvqXxVsF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvqXxVsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727516949; x=1759052949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWEnLLCMV/Gv344yE7Rvhubbztg0vR8yypTrFpSKlcw=;
  b=nvqXxVsF1IFW/WJIE2vyq9/jRYC0irvjJvc7hxfgCzayo5FQYQhZsJH5
   PHc6AVJO1gWeWixYU8aqXLs0OHfQ9/9VhIj/noqiZgt3NnLPtcbrb2HKf
   4Qog4lFlBifLfH0UBp1r6XpeEK8GIVGYVZAiLxIf5TnPU+B6c5cvSHIhJ
   qjczMk4ZqtwSUkdkUZOp651uM8fk9o/cmUowgviWmiWDKuINw5jGVOtpC
   z5PmRqVUxeGR5h0A+zpnRfgoOKxH9XNe2wwckD/9hgAZYkGBjBi/VcLyq
   CqouWn/ZJTF41GS3m17J34TNwHEL5aQ7xj+OlX1uOwW2FK5XXe4DVdrWS
   A==;
X-CSE-ConnectionGUID: cIBJOvzOR0CYWl+39F+1NA==
X-CSE-MsgGUID: 119N7KfrRMa1TC6dv2R/YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26130608"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26130608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:49:08 -0700
X-CSE-ConnectionGUID: fiYh+2UsR56ygBUlGxIGXg==
X-CSE-MsgGUID: KnhYLbxXTmqhJxqkvXo9zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73097676"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 02:49:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suU4X-000N6y-2C;
	Sat, 28 Sep 2024 09:49:05 +0000
Date: Sat, 28 Sep 2024 17:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4885/16788] drivers/opp/of.c:1081:28:
 warning: multiple unsequenced modifications to 'val'
Message-ID: <202409281747.CKAOC95N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: bfeefbb7cc6feae6ff295bfb93a3079dfce4d709 [4885/16788] OPP: Add dev_pm_opp_add_dynamic() to allow more flexibility
config: i386-buildonly-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281747.CKAOC95N-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281747.CKAOC95N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281747.CKAOC95N-lkp@intel.com/

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
