Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157094;
	b=OtrjkHSOmQRFuVsD84ZfgGzj9AaqKufDLj8fJFA2Oc6Cxg4iBU0cfM+WV/P3EIFkW6Js
	 yPRY71tIbt3R/a6aK1eEI2mJlZyofVTDbDWu6Z5tH9UbkFPeU7wDjEO2P0IJA2PonZ2qv
	 D+0Xdy740jbgDaUthzjUbbjdr6292vDllDUL3Iu9vg4OJPtaeHgH1wBnN81jIOEzOeWf0
	 vmVSXXlBVRIM8jPKln52wI6B2krzIYAPTz4rDJl4b2yjp4Lu4FGX0Gnl8elTe0GTCP5Yq
	 FWjJOeq742FhZtZiCLZAQSLzXOErt/1HQIbN7xYBUXYOOLrRTrfKQm1rwjBy/dV0Vyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157094;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=h0aDSAPHPPMv1Y1FWGXMdYDrAXcuOqdHSkS9zIgSVRM=;
	b=m5kDSJLaUwigeKNRq+DizTDqaVQIqkvRS4g+J+IUIoBiwQysPydqZ/UDiuVmC53K14tJ
	 VSm+PgGzBX7kLBhdAfxjSHqTHveGHGqZUX90tSnTnNt6079rxHKl8Gb8tmxw1UoZKT/NP
	 D/YI0eC4tIYSGZ+hKfK7TmUoPtKn06sb3jUhj3DyarzF/e/ABya+pHcrGqWE7dCT/e/B6
	 A/m/JLJ67m3Xs3y4AOwwlZVzx6CuHju8MgS2QcHBkoAGcMgK7zThTH4huh0tir9EZGmxB
	 MnQovuzcvIpPLcvxaHlUbkhwihRBklVwJpxvJ9NhToCkSMhRsavoab/zwHUJIa8nMTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOs+dzi5;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 16:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E92B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOs+dzi5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794157093; x=1825693093;
  h=date:from:to:cc:subject:message-id;
  bh=0AXvrP+JH0EQ1N5WFsMoeQQT156TDPGLur17GEaHAPk=;
  b=MOs+dzi5uSyoVjmF3F5GlwbwSgyT44w8R+JTzZx3ccSSS5e4Qe9uNuPJ
   K0kUazrjVhy25Pfi2WQxP/32O0MPRxaJul8ScsL5kAJ+jY+9ARetONPu2
   bxY/l9rA8cZVjz2bGHNMTHiJ83vBbW/9z5aKOE2V9Xdhyhtyj75etBBXf
   m7JtbVgk/GSUWQPMAmLLj38K5hl3tjPx0rbAs38CjZUd+2JEB9SD+jxrM
   n8MOu77oMBWrkJOukf4HB9hkXGsXQTZX84T+r5jxOQxWLRliGwQEw/rnQ
   k3XJRD1HoBwiBjZut9yEC+w1j4Ykx6aQPvNCehlrlm2zdLPXhk2+nios2
   g==;
X-CSE-ConnectionGUID: cNBVYolPSWaNCX/9r1a9sg==
X-CSE-MsgGUID: +kCMozMBT+etAb0dNylAvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2798340"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2798340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 08:58:12 -0800
X-CSE-ConnectionGUID: SVZZkgOgS2aRqzu6JomeoQ==
X-CSE-MsgGUID: //spROmxRPyVeH9fvnvKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="8259018"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Nov 2026 08:58:11 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ6DW-00000000BcB-3oyn;
	Sun, 08 Nov 2026 16:58:07 +0000
Date: Sun, 08 Nov 2026 17:57:46 +0100
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bod:linux-7.4-rc1-ife-v1 74/102]
 drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous
 prototype for 'vfe_comp_group_output'
Message-ID: <202611081720.cgoo5h0D-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git linux-7.4-rc1-ife-v1
head:   830b5bcc668eb7ef5a2fe17463a2a374d2e45e04
commit: 67e450935000b5b20b2131b3206edaa95d248227 [74/102] media: qcom: camss: Add helper function vfe_comp_group_output
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081720.cgoo5h0D-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081720.cgoo5h0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081720.cgoo5h0D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous prototype for 'vfe_comp_group_output' [-Wmissing-prototypes]
    5110 | struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/vfe_comp_group_output +5110 drivers/media/platform/qcom/camss/camss.c

  5109	
> 5110	struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
  5111	{
  5112		unsigned int i, j;
  5113	
  5114		for (i = 0; i < vfe->res->line_num; i++) {
  5115			struct vfe_line *line = &vfe->line[i];
  5116	
  5117			for (j = 0; j < line->num_outputs; j++) {
  5118				struct vfe_output *output = &line->output[j];
  5119	
  5120				if (output->wm_num && output->comp_group == group)
  5121					return output;
  5122			}
  5123		}
  5124	
  5125		return NULL;
  5126	}
  5127	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
