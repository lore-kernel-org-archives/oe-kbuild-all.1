Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4620220688
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153464; cv=none; b=Db+R+tW0gUT/1sx89r3Xi1RNTk42rcZjhep/F9Ynuj4E8DyKxwv23oW4SPtKmm5i9OoGIILGTwQ2veyncjSxbiwaS86Vk3fxSGNiTho72OUQmZJPgM+Byd8ue1qUkBOU7h7XlJIzNb8DpD5w53/b1VpUFl3JFWkpacDgLByXwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153464; c=relaxed/simple;
	bh=CP7UtArpu3SmJ4AMvVmMFYdF+ory/yqcoNJ/UH+G/+U=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMmdZc0qdcRGd4G8ERQD/PMjZFxqM8vnlFBlNLflExk7I/xcURs8I3tOF6V36y/gPLIBHSo8baZOr2JtpNs9knvJif92Ko+UmyAzhcQF1YnrkiUmVOD7O3QCM+0wKNZeDFrmn/OnTk+MVP9zKm5f3B1wtRpRC3cN7zB9a4JQEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUOyYsTG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUOyYsTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740153463; x=1771689463;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CP7UtArpu3SmJ4AMvVmMFYdF+ory/yqcoNJ/UH+G/+U=;
  b=OUOyYsTGx0MQ/WcgiOGd3Q2LQhHu/vDgMKpHBHczdXSGJNl8QBbiaF34
   tsb5hgIgEpwzKD+t7/akacOxkAu2sBEAwD/gvb6g1m9YSHR6KbetYtAVm
   Zs3YgcjBkYFUwX5+YfN8q80LNoG9kx4jBY2Ze7jkopHbxnXEAbT/G+wC8
   LWuQFn66jkbzhQkjnlXg1itxFA3T64vL8Q1dKU1IwKQkk5v//nhvkL6Bz
   gLFNG4LMOcqxJH6i8g7GnFylIfvsAD7SLf6XaxfRtsxNsmGFNUn3wlyqJ
   VbF4eZtuMcpJkigJejqULU/2qlMI/Fc6iEAKV1JSw2fYpOdBEWfUYWB3o
   w==;
X-CSE-ConnectionGUID: c2flfKPRSambIg39wUubhQ==
X-CSE-MsgGUID: BtJcuNl0TuybmDJLxylHxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40852159"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40852159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:57:42 -0800
X-CSE-ConnectionGUID: 5VOvAjv7Rby0v/n+igPNew==
X-CSE-MsgGUID: PWsntDKWTqWnWGmEULze5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115227750"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2025 07:57:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlVPD-0005hH-37
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 15:57:37 +0000
Date: Fri, 21 Feb 2025 23:57:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] sound/soc/codecs/lochnagar-sc.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202502212310.avzKbIG3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piotr,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 16123412a6283bcf956f1a377f2e799a79c2b439 [1/1] ASoC: lochnagar: Add driver to support Lochnagar 2 sound card
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250221/202502212310.avzKbIG3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502212310.avzKbIG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502212310.avzKbIG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lochnagar-sc.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
