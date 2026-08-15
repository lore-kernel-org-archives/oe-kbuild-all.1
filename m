Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0A1B4223
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 17:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786815421; cv=none; b=CrlqA45PHxSCV8oFYYxDGyrkb7TDzD/XA9MsKlTJDm80kY+vN4RJDCQqKu/9rMdPxUJJarb6vhT7/2WrzhHjmeUy97u5/KNq8O5W1pjrJSUZY0UgkaAvATm1M58KfA59Ut8Ea16XqbOScRP+1h+TMwuPPKr51MMrlQvknRiQ5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786815421; c=relaxed/simple;
	bh=MgayC8aAyYpkE5Uu1Q/FJBDk5KdfCN5FQY22C0NHmi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovdwR6J/pUCfVpq4uTVIMBMFJjF26WqCLxlvGMEyjsMimYuI49VktaZ1SOhITgB7WXuPPBL7wZMBReI7VmxzRvlYhrQCv/hNMH9/ixU3HLeccBJzajiK06wBy+vrBtzD8JkreYRWKnSRlhqPTeSVZ32b9GrFzOMenH+7CElP+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKnBODa8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKnBODa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786815419; x=1818351419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgayC8aAyYpkE5Uu1Q/FJBDk5KdfCN5FQY22C0NHmi8=;
  b=hKnBODa82lOyuL8BwIylN9zMQ3Dw+MtO5aqYdlMCiHgxdKgSht1RIBv8
   6pEeCWG7tkDR/llyC0plkqN1fZz/Acd5hE5jZqu0zhouaffn7Np+yg02Y
   1GcdJtLDKeCoBPMJdSvF1KeijaHJHpornM7M/4TyRojFpDn0GPlSTizr1
   macqsBXmWvGSUzGDjvoYGmzvXwoJ1To2gWZg4rJkkJd5NBJcX9Vjqup1A
   xO3BU5zjlE1G9hbUnIs3F7c76P44jg5eLuxGoLMiO55e4t1gEzUYFEEaD
   8yeKbF+xlBbEfSFrc73iXqB6Ad3aD5wLv4r4ZRwXdsms4jGc29ptMok8d
   A==;
X-CSE-ConnectionGUID: efTt/R2HRdGYQaqS6sxoXg==
X-CSE-MsgGUID: yg+oUvspT4CcnZ38GeeUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87235401"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87235401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 10:36:58 -0700
X-CSE-ConnectionGUID: Yl8fRK9MTVOJnnKCMKeSZg==
X-CSE-MsgGUID: KuooLmeaSbS/Szg119Un7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="264062995"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2026 10:36:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvIJQ-00000000cOg-2nhx;
	Sat, 15 Aug 2026 17:36:52 +0000
Date: Sun, 16 Aug 2026 01:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe
 failure
Message-ID: <202608160100.66rYQ6on-lkp@intel.com>
References: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2-rc7]
[cannot apply to next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/firmware-qcom-scm-Fix-resource-cleanup-on-probe-failure/20260815-220308
base:   linus/master
patch link:    https://lore.kernel.org/r/20260625093644.3918184-1-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe failure
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260816/202608160100.66rYQ6on-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160100.66rYQ6on-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160100.66rYQ6on-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/qcom/qcom_tzmem.c: In function 'qcom_tzmem_disable':
>> drivers/firmware/qcom/qcom_tzmem.c:523:9: error: 'qcom_tzmem_using_shm_bridge' undeclared (first use in this function)
     523 |         qcom_tzmem_using_shm_bridge = false;
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qcom/qcom_tzmem.c:523:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/qcom_tzmem_using_shm_bridge +523 drivers/firmware/qcom/qcom_tzmem.c

   520	
   521	void qcom_tzmem_disable(struct device *dev)
   522	{
 > 523		qcom_tzmem_using_shm_bridge = false;
   524		qcom_tzmem_dev = NULL;
   525	}
   526	EXPORT_SYMBOL_GPL(qcom_tzmem_disable);
   527	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
