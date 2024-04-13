Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CEC1BF37
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712982492; cv=none; b=NDCjhYa999NDEWp86C9duZD27Dd/lyKxRxo3WxeQ6Dv24REdNQZjc2+oeI+9B+IiXcg9B14/jja6SX51EmnYtjDY/7erI83hiVFYjdp+59n3WG2YPlwDJaAWntQ6HheMXIotVEOMJLkJ+DoBtefMpkWg1zENiO/Ru/pxwT/R5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712982492; c=relaxed/simple;
	bh=Tlq29TnCBG76qRLTeMIiom5h+MleNkrQIotW8c4INfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hvoDT86Sh/oQLMRh2MyTGkyP2Z8rKwsOmitNPKuz4EIdeCYX3vUPEjWgHVKXP3RY1uzg6Cl964pgriPJD/weLBeXZiYbinpA5G3RsVqjb+uFMj0ANSMF4CRJX4i1wLkB41pcAsdRs8x+lJEMfFQESVZyVju3CoGZ8S2v6aksuDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2k0yZY7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2k0yZY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712982490; x=1744518490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tlq29TnCBG76qRLTeMIiom5h+MleNkrQIotW8c4INfA=;
  b=c2k0yZY70GYnFIV4QRWFnMfIlb8YEimYuB1fJgwPWxUvGl12RXzHgOmO
   O6sH/mZNqJgGvKR+rOyck4xnX2koactEFjfl1wae2PtyN9Do7KxhycyJi
   o5C9BCJKAveL0U12rjuQYCSnW07VEX7hEvzta7a8bAn/zejuSOyvdZRFf
   87jxpmKfiEyWmkKfo33/0IQDeTu353DWI27JYWWcpdy4qLTHA4Gb97rAv
   YgaV1wyAeK1mHOKcBaotv+l/u6dnwjgPRVK15EEROrO8wMbIdFeLhNm/9
   cJOF12TcTWuuR7jo+0tVhlEZ3jm3saLtNK0qvfatD9zFOMRuCwZizGPD9
   Q==;
X-CSE-ConnectionGUID: p4x77oQ3Qw2MUZnnpSJosg==
X-CSE-MsgGUID: DjKWaTsnTiK36mX2N2jh+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8290679"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8290679"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 21:28:09 -0700
X-CSE-ConnectionGUID: MkFbp4qXRDynU2MR2fuXvw==
X-CSE-MsgGUID: AgKlwmr8QTWWncSTbDZI+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="26107247"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Apr 2024 21:28:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvUzl-0001jM-2L;
	Sat, 13 Apr 2024 04:28:05 +0000
Date: Sat, 13 Apr 2024 12:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-doc@vger.kernel.org
Subject: [broonie-ci:asoc-6.10 18/45] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/sound/ti,pcm1681.txt
Message-ID: <202404131256.sMzJJ8jK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-6.10
head:   62bef5df35a87d0f8464b1a8837540988cfaf5db
commit: 8167bd1c8a45c289316417cf938bcd8ceec24fd5 [18/45] ASoC: dt-bindings: ti,pcm1681: Convert to dtschema
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131256.sMzJJ8jK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131256.sMzJJ8jK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/ti,pcm1681.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
