Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A5621E3A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028937; cv=none; b=VosUzfOkG7UsfpSXgDddJPfcOZ6COc6ozAJHG3KWXqcC5gEpSDDTsOW4OwoZF2kzQtjda8b69pWqaxI0sBcbUiQR96qOL2bc2oRyh0LI4faosZW5hCKVd1g5wI9gWYsO8EuR8q4ehRUI28u9KSL0BZaH8tuovlYhQ9AFPMDzkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028937; c=relaxed/simple;
	bh=LZbqEQACAqVvy4wpA8LKvldM0m2VrOonUdM69g/6ogo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N84W3mvrB7D8ZB7mXr939PAbpHvvguRkl167D7OdXZOQ/8yDQ3/vqP3ej9AkM+pYXg6Tp+WD9t1xnWA7977SDfrvhh2mUSuODVniK6274y+TZpTyTuBbSxdSK3cpgIa898fWFTqZ8bNUq1GxUVUeP3UjFjFSpX1FWr3tYJ/7xPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crLlgvYs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crLlgvYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729028934; x=1760564934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZbqEQACAqVvy4wpA8LKvldM0m2VrOonUdM69g/6ogo=;
  b=crLlgvYsGQjBMNIIzT1dg/OZcascmwbdI8+YnhcPU/eYUznkWOdy+eth
   9TPAC+dqU4eLbW+t2yaSTx+S/p1ihTigfKQms3NDfLrOVKl4hGrq+ATZX
   Ur0blzyaZ1bDNa3ZDwVyt1L98+6k4G6Kww+8HFlc3ttN5/5NRRS0y6Fbb
   UQraIi1J8j3ChI4KHTBYh6sGPpx5KxzAKdFQ9PBcIW49GUXBl47U+qnkT
   LTuzSWFHvozk8J7i6ALnVPRVM39pi0kjcqOm7W1FA1nzqq+c56+9d+//L
   +xXR7yBpRsfrIvMSYdB4NgObkH67FJpH5pyuB8wxAkeFfdP6cffH61nTG
   g==;
X-CSE-ConnectionGUID: 4G1DCpuBQtG4/5qBrMOW0Q==
X-CSE-MsgGUID: BYuey/BSRPy6oMnblb3TuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28340719"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28340719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 14:48:54 -0700
X-CSE-ConnectionGUID: JsOHYuXQSCC6xY95cw1Rmw==
X-CSE-MsgGUID: Wg3Z+sX5RlSm8fD9aBtfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="77974187"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 14:48:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0pPN-000JyF-2T;
	Tue, 15 Oct 2024 21:48:49 +0000
Date: Wed, 16 Oct 2024 05:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [lee-backlight:for-backlight-next 32/32] htmldocs: Warning:
 Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml
 references a file that doesn't exist:
 Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
Message-ID: <202410160540.vBWRjKl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   0eda30af58809224d80dc3bf3f368fc677fe8c08
commit: 0eda30af58809224d80dc3bf3f368fc677fe8c08 [32/32] dt-bindings: backlight: Convert zii,rave-sp-backlight.txt to yaml
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410160540.vBWRjKl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160540.vBWRjKl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/leds/backlight/zii,rave-sp-backlight.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
