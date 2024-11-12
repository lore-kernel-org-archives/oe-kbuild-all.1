Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF018206955
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429459; cv=none; b=qzMBDhmYjdv7vXvWED/wFaeRO1/9rGOWWEZjT6nB4s6fWcm+V80DWjH3f69qwQzpbxYM9zBdq87wQYhTPtgKWbrIXBPbsQV2hkC3HcIQYshW6Y9u06D0wUBh0l2sMKIkkGh2XwTjyg+KYM7K+RSVkOZurSEGyPLqKg2/stuKj9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429459; c=relaxed/simple;
	bh=T5ghT6YMHCZpWRnJnizxzXnDWmAfttpyEUUGC406lpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3lM5vkMJyf4WhbJjDk4EQrTP+YVLeBoTWxMmn0fpmlwch+E9Sfkiolht2iu/+lM3uaEoHcy510CNA7M56gnZqO0Hv576TO5u3leNzKvxF0NXc/rqd+TMx6jnTRWatt57ZftuVuGKeG1mB1c+uNL5ikuIJD2pUmgwDtIkeLneH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4OQ21eS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4OQ21eS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731429458; x=1762965458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5ghT6YMHCZpWRnJnizxzXnDWmAfttpyEUUGC406lpI=;
  b=j4OQ21eSgq8//GggByKSMOeQBT+vxkoOV9ONRB919BfmUAtFKHCWGbz+
   41aFt14ZohR3BcYUQJSGg4jeR7xzneIiFTBj7jwmccXeuPdVq29PSs9Jy
   9lvAcOl4eeR1HPQAu4mGy7nej36ie4x7h5MQYgyb0pNCE6/9HhfY5CEkl
   0fvYFxCbjFS4zYpTHxW2TFDPF9dEBhl3DdxoDE49Pyg/QOWlRJd3+odem
   mxXMLnoZDXCyfFeL8pfcGdEVkgzkIe6kvmFlulkadFSG/I4qPnK5zhXeD
   G+PiHn1W6CIy7deyZ6B3gWvHYHZU4q0m6XbqHFz3oOnwx4wkcSR/Mddvh
   Q==;
X-CSE-ConnectionGUID: 6Itg8QrES1Sat67FVLNbsw==
X-CSE-MsgGUID: 59/PXsnCT7OB/5BMzY3leQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31150189"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="31150189"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:37:37 -0800
X-CSE-ConnectionGUID: MEkSZxWFTfqpERDCLtjDhg==
X-CSE-MsgGUID: L01L0Ct9RSq3/cnbVdLWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87976453"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2024 08:37:36 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAttV-0001X5-1k;
	Tue, 12 Nov 2024 16:37:33 +0000
Date: Wed, 13 Nov 2024 00:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [lee-backlight:for-backlight-next 32/33] htmldocs: Warning:
 Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
 references a file that doesn't exist:
 Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Message-ID: <202411130041.MilCjuGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   3adec6f907b698b32ab62f70da31b41abed00c59
commit: 0eda30af58809224d80dc3bf3f368fc677fe8c08 [32/33] dt-bindings: backlight: Convert zii,rave-sp-backlight.txt to yaml
reproduce: (https://download.01.org/0day-ci/archive/20241113/202411130041.MilCjuGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130041.MilCjuGL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
