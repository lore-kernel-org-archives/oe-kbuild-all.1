Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928D15EA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 01:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713144871; cv=none; b=HAwGh7wPQfqfXKuMp2ZD0cAv5JmT2B3g4wVKfBLIPo9iC5iTeFg1UmZGjsHXi+SXCiTB5Ljobo0CLA9XQ1xj3RVf1rGwnjxw1MZnjl3wdZEvTxtgoQMyFwqKaEwq3hbHCmXN46yrXOj+HieWwMp3p87RsQgIBAZ1Ae6/didQkto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713144871; c=relaxed/simple;
	bh=8uoBv/Eflouqt4r8vLK9eEZJ/oQx+ZU6ZnRpSmJMwoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SuJ0LK9D9bL1wq6ETRZ6ljHwm53hkQkB6YGikNyNIH3T7762XqlEXBfFD16vbgj3WhS81b6VGG3mx/C/db/w0DzqrykYoL6vsm6p+ao3zl1w5M1iTvR0wjUdtQMwjL7MyrpfV/ZIUvqTGyLFMjUQR9uZN6Y6KpZBY8JmvehcFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfvYQIA2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfvYQIA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713144869; x=1744680869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uoBv/Eflouqt4r8vLK9eEZJ/oQx+ZU6ZnRpSmJMwoc=;
  b=dfvYQIA2Xr9kGhBRARyahHgja2y1/WIKds5Ayu6YPTNiKPpPEGocmeX9
   JR4NpTsWkYUQPWp5680t1EDCAfXWpdCp0HZtw4yvR6sNtYOwXiTl0CXzA
   iKyZUxJZ+zhcMdzpWZb/d423GzbpG5bJFzuVFuobjBFEg3Cy07g43SaRb
   qEwiSqZv67f+cyNsfkf9cGx1wO00h0TCvnHCMJCcoKN3chLgK83KXROFk
   0bHjyy8aypCwt51UgwG0s7MUszQZ71/Mwu0Qpmmm1zJDpod3HYechOAad
   v9rcpjBhTvNheWRh0r9FFLIqpURwk/HO0mFaRKJbAgDjqeVVTwmBBpVIp
   g==;
X-CSE-ConnectionGUID: A5GpARVMT1OyYU7YweDklg==
X-CSE-MsgGUID: 7xzGQjB6TQa0O4b9yB1WWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8376603"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8376603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 18:34:29 -0700
X-CSE-ConnectionGUID: 0ZS0p2nBThGyhp8wtBIpAg==
X-CSE-MsgGUID: ct6RZFLMRm2CoyZIm8W9bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21687840"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Apr 2024 18:34:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwBEX-0003tY-25;
	Mon, 15 Apr 2024 01:34:11 +0000
Date: Mon, 15 Apr 2024 09:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:pending-fixes 180/265] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
Message-ID: <202404150935.JA77XfHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   2ed61b7ab3af2ea75840dad4f40e09ffbc7f04a3
commit: 3731629ddb80ae5f52cb95d7321bccfb138cab7f [180/265] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
reproduce: (https://download.01.org/0day-ci/archive/20240415/202404150935.JA77XfHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404150935.JA77XfHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
