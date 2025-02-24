Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C318A6D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 07:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740380576; cv=none; b=kzIgGvDL9qgy3mM7y2+TG+R25DLZPBH+ZwrJ0ibIC34yTXueO0P6biD5TVT5tktQWoKnIeummLTPyaoTA2xh7Bne5n/8/JpK6IKbqztcBRBDYZsJIWPd5o5tDAYfl2DlBI82BAN7WhSLBYNMmC+2hIGecrnmhZZ6z4Fc8MKerHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740380576; c=relaxed/simple;
	bh=umPsyyHlTXKR4U4pumBHmhqRSONhbLxIp0E/F+bC8fA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaeVzKUoFsVAs04FeikEglPUNpjwiuz877v6+1KAdTWjbbx7YQ1qrzhNN+rrxZiA/uKoi2UBfSXDuosHAqwiW/0vnn83MlyYz2FzCF2louT27ha/JiwYOOJCQY/0+m6rAMvx2olEAZACcjuxcUooZ/S+IKBJa+t4T3nIklmc5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cnu8bEar; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cnu8bEar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740380574; x=1771916574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=umPsyyHlTXKR4U4pumBHmhqRSONhbLxIp0E/F+bC8fA=;
  b=Cnu8bEarK3W1N2E7DJy5q4pIehEoJ1KKXniKQWLDqnSsDzRj0w3iyLy2
   YmCNV3Oxq3RxPUkpphCdDQAnJpWU8aEnc/ce6+dJyF6aCMNlRCJl8TUWr
   EB4Uz+s6fWW+1bkPHUS1QJQzxxhp62h7yN8f1sh4xQ0lOXLIuXGO8jemi
   NdfpnCUbsuj2iFufIExGv9I96Gfhh68ijYyCNHqlLp/wcsezfv2Rmx0iD
   yFZO7VVhUj3zQzOEadeYHnjBORH/y8NzVn3TPf3AvapEhjSSTCCcPMmQW
   8lzHCKbNdkUFBRtRmzg256ysap0aFuDJ3TT3BlEey/w8FPzygRcqpBDow
   g==;
X-CSE-ConnectionGUID: BMzVmYUoQcikmyW6wI32LQ==
X-CSE-MsgGUID: JsLuilseTJa2i9sobNlcHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="52116400"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="52116400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 23:02:53 -0800
X-CSE-ConnectionGUID: cEMvzq5aQJ2f8WUnoy5Kqw==
X-CSE-MsgGUID: A5QiMjMgTjypPMaiGmAgIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115774212"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2025 23:02:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmSU4-0007xn-1H;
	Mon, 24 Feb 2025 07:02:33 +0000
Date: Mon, 24 Feb 2025 15:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: kbandi <kushal.bandi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/media/i2c/dw9714.c:336:21: error:
 'dw9714_runtime_suspend' undeclared here (not in a function); did you mean
 'pm_runtime_suspend'?
Message-ID: <202502241418.AxKXP0eS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 9cef7f9b88549f0e9b46631edd29e5f619afa928 [1/1] media: intel-ipu: Merge IPU kernel driver into 4.14 kernel
config: s390-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241418.AxKXP0eS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241418.AxKXP0eS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241418.AxKXP0eS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/dw9714.c:336:21: error: 'dw9714_runtime_suspend' undeclared here (not in a function); did you mean 'pm_runtime_suspend'?
     .runtime_suspend = dw9714_runtime_suspend,
                        ^~~~~~~~~~~~~~~~~~~~~~
                        pm_runtime_suspend
>> drivers/media/i2c/dw9714.c:337:20: error: 'dw9714_runtime_resume' undeclared here (not in a function); did you mean 'dw9714_runtime_suspend'?
     .runtime_resume = dw9714_runtime_resume,
                       ^~~~~~~~~~~~~~~~~~~~~
                       dw9714_runtime_suspend


vim +336 drivers/media/i2c/dw9714.c

   334	
   335	static const struct dev_pm_ops dw9714_pm_ops = {
 > 336		.runtime_suspend = dw9714_runtime_suspend,
 > 337		.runtime_resume = dw9714_runtime_resume,
   338	};
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
