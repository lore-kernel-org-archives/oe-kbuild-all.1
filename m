Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FBD1369
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLph/bNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697419541; x=1728955541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lxNpNXfgf/y3XNi7W2VJ02dPiF8Rjisg0fnKP5Wpvts=;
  b=GLph/bNNIlgUKZG/Erm4B5gsYIVzfrbvNW7V/+z/Kfa3/RiVB9nF/tLH
   QHU8gMSyTucBfamN5HJyz4b0ney/z52Staw3i82ryFJdQKXLIuJvV9Tnr
   oL6rMbtC0KVAebpTnKYgy1K41geXrvdA4elIZjRPWANmNtyEfNxG/4TGK
   3gqAHmBAv8VYMCAX15YcaV3Cq9sSaOV8kNtAx3W3s/ZtK/m5BUhtdOW90
   ubMnmjjOLJURBmgWVAMVXLTgQhkrGJ3/F7XqTF+jUl/DKhugiT0IewwOw
   tEqYcVG4s/6U2s7AIKKYdt5Z+QRcLHOVr6/eruk6dV7Kup5ICcmthqL/m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370501934"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370501934"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825811579"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825811579"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 18:25:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsCMQ-00080B-1K;
	Mon, 16 Oct 2023 01:25:34 +0000
Date: Mon, 16 Oct 2023 09:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 140/206] checkpatch: ERROR: "foo *
 bar" should be "foo *bar"
Message-ID: <202310160900.0FZnWBVD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="eO51XacJf1dqEAvF"
Content-Disposition: inline


--eO51XacJf1dqEAvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 4ccdfb49789232be99e43131d1859dd79ac0a5d2 [140/206] ALSA: control: Add kcontrol callbacks for lock/unlock
reproduce:

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160900.0FZnWBVD-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#36: FILE: include/sound/control.h:21:
+typedef int (snd_kcontrol_lock_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_file *owner);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#37: FILE: include/sound/control.h:22:
+typedef void (snd_kcontrol_unlock_t) (struct snd_kcontrol * kcontrol);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--eO51XacJf1dqEAvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce:
        scripts/checkpatch.pl 0001-ALSA-control-Add-kcontrol-callbacks-for-lock-unlock.patch

--eO51XacJf1dqEAvF--
