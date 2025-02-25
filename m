Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEB2199B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740449071; cv=none; b=JUNDvtUcNkT2PDu+EIPGjl7jX5ZQ48O221+q6ryhlpqmG7wdWikVHhFwJ7DECVoDMGA+6NpDC/cdI3WY9QaJ6VcSXD6Si5Ar6I6lTV55mhFx4eIJs4iJDOBAO62nz8GDsvfbmPzmCVGgmJsXZ3IkKIu4gsKC7mY89ODIUHb4Iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740449071; c=relaxed/simple;
	bh=gPt9zZpwsOlyi+V6qHKNgcK/P6TbuaG0ByrTtCB6waA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+OsCz2U1zJmb8bBz/y4EPyJE4D9fzalbQAdhoIKfVYgfdVeMBJUJoVzSukk5ynkQZrs4ii0dZO9z+P1T8wOj2L1xXmuusXGbf4YLUFk3yEbDPWyZ4QawMa/DSrMZ4o7MX5Npw5PVhPQ9v1E3GGaA9qfQk7tenySk8M7BXgb8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlI2JKBu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlI2JKBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740449070; x=1771985070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPt9zZpwsOlyi+V6qHKNgcK/P6TbuaG0ByrTtCB6waA=;
  b=PlI2JKBuCfi2ONkjLJ+h1acoazwK/sR7GoEqaySiAc70KFmU7CFjgpom
   /VQlFNJTwx9o0F+rKHgSuTJgT1C6IebLGOFNrOxDXuvHqlZL10Dn4PcER
   +AIUP6Mq3fR6VOJoUlPC0PLbeVikzSSBnNeUTDWka3eWtkoM5g38OvPNx
   sOnfrZtB7kpzparmqD3KlekYnDOU0YXkFO7e9rsjDDEDHTRTi+fhG++qm
   M7SjcONiIAZ3EFndPCxLpoMix4UObpkc67AlWoooSyuFpgfrdnYndj+5I
   eDrIFmkVWljRmu6DDAc4f+zOlLOa55CvfITM8XsCjymt92sRT+QfS6bLD
   Q==;
X-CSE-ConnectionGUID: WdT5CPOeSBiFTcaJyywRjA==
X-CSE-MsgGUID: nPfU0tqoSxq2rRSpsJzPgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28827272"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="28827272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 18:04:29 -0800
X-CSE-ConnectionGUID: 7j3TW6SbTKew+uBNG07GgQ==
X-CSE-MsgGUID: fWRbOQCOQ0iRJV6Ac38fXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116051075"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 18:04:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmkJ8-0009d5-0Z;
	Tue, 25 Feb 2025 02:04:26 +0000
Date: Tue, 25 Feb 2025 10:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 5346/5954]
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb:
 /dp@fec00000: failed to match any schema with compatible:
 ['rockchip,rk3399-cdn-dp']
Message-ID: <202502250941.ArlU6xgs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
commit: 066a69db9db3f0c58cc8f74fab169573556f322a [5346/5954] arm64: dts: rockchip: add overlay for RK3399 Puma Haikou Video Demo adapter
config: arm64-randconfig-051-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250941.ArlU6xgs-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250941.ArlU6xgs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250941.ArlU6xgs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: pinctrl: gpios: {'bios-disable-override-hog-pin': {'rockchip,pins': [[3, 29, 0, 188]], 'phandle': 183}, 'q7-thermal-pin': {'rockchip,pins': [[0, 3, 0, 187]], 'phandle': 182}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
