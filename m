Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822E163
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1lDxyZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697415672; x=1728951672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0VJr2I50cJ3EouJiXUvQ+GCsrpdMYXGsIGu6quXDWs=;
  b=S1lDxyZf/XPJQAy/9Rv3z7Biamr3uv7DyVzzulw6gE3qn0Q6f9ENVlB6
   aWgynv3mYfvnKo9u30BwvVnrd9svJ1HXyjCi6YqpU+KMQtaTt+FLunhqS
   R/hK+zCukY6y2cj+MdZJdC3/0v5ZS+ipVjpMKlE/b6uMw462z3HFrIhNX
   i9SZ+gIApdIysQtIwYbUxv2AQzWIy594ccijxuR1Pmf+Z4I2vmVOvvC/R
   NxSLaDT3UobnVJUfLEZghNEXQNsEypWrdlTob2diGdQ5PvMr2Lya1/i14
   m6Mjof+gQPKwAH5jUtj7TOkBDakKy2JIyOz5coqXfgheASVhRjBy99U63
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370497923"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370497923"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871879352"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="871879352"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2023 17:21:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsBM4-0007xJ-1d;
	Mon, 16 Oct 2023 00:21:08 +0000
Date: Mon, 16 Oct 2023 08:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 140/206] checkpatch: ERROR: "foo *
 bar" should be "foo *bar"
Message-ID: <202310160850.G8fuhsWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 4ccdfb49789232be99e43131d1859dd79ac0a5d2 [140/206] ALSA: control: Add kcontrol callbacks for lock/unlock
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160850.G8fuhsWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160850.G8fuhsWR-lkp@intel.com/

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
