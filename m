Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167656;
	b=BLCMrBvKyoGra0duZZiyI9JVExPjjhftZRqYJDPBp9ox5lgG0dVeB39JsowttkKxdTOo
	 EH6sNsUqJbUZfFb2ejaUf4R9l7iu3iTc9eQchjdhRp5NiAMNZzO+OQoLjWWrFl8S3sY2s
	 CQAaJEILrZeuoh37sXn08BUfU70x/IWSKehxcl7qiTD4D2KAhroRBOqQpjtuQcEQird9+
	 S9y3/1MkX28RK2qtaXJS8NxieCMh1DjBjPNVz7Ss9KH5xWefx/G0u7HqO1qWMUu3h2sSE
	 iJFLp9KKQf03szpvGrxLEXw8d1P4VHOURHyIe6u979iUM9tUdIZxNOxOTFakJ+rJ2Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XJfBEEn54IvM3Hz2nn7fsRBI5ZATG4A1ks3YbkxCKFo=;
	b=ML34ZS5+Zb1Q8ApFC59VLwscfVcdd15Ve2GSezZ6ENkCm7TDluWOctNFnC8xqrOKop1e
	 CmLXQH/VU2iU0d3t6PbQScA9CdI5RRrvlEdFyWgpPWaXnYiD9XSHsufF7HoLXs9x9blFC
	 eL6oSn/HXI1AnnA73KtmteHNVX67RnZZSUOYlvh2BkGvvZSvRd2N4x710QSKP5x0baoJ/
	 UVXTHq58Ez953aMIDTGXYT+F8fif7HPnW/iR4q64dWEV79s8mPuwkWCE2ASX/uGzIAVKl
	 oOgscCj6DXAO/srfw9uoIQD8FZFUKypXfVO+pQQKKYebv6g66SdU6JKgtNzh3sSooBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mUVbo9is;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1257606A320
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 19:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1257606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mUVbo9is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794167656; x=1825703656;
  h=date:from:to:cc:subject:message-id;
  bh=MLStlf8wPEjq1MBQo9xwQ1RSj2kTNTFxTldf+WNuRgQ=;
  b=mUVbo9is6mUEXp36keFP8zIbeNctFKJbNl3bqADgv5d81eIwsYXUel7S
   uAJfBBg0Mj44Rwn/3kC3t8qFYBOGBz0tX4742dt9m3w6vF8VgmS/LGHVI
   4w5LOYcMWLmsLlwciIQuBNITZeI1d1l1KGvUxs+jJ1sCnNnJeTAH0Vzsp
   O9T1tELaBjcmdPXHspLN9Gzu+go45HoMSlFv3y7uAahX2fCruvqDvhqyi
   E0ewktXs+r8gOprvdhE8ALd83UpishI+3SDV7Yx9TFsywf3B5a0C1Mld5
   u1+hPd6EE3S2N0NeyHRFxkc6PsgQPBdVoFV/Cw0fz1e3LM0zBzgCNVsYM
   g==;
X-CSE-ConnectionGUID: P8+OiPBNRGywHDIUyH2wYA==
X-CSE-MsgGUID: m2XTkZNCSaaOWUARrOor9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2800465"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2800465"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 11:54:16 -0800
X-CSE-ConnectionGUID: 2g2YFzJzSVqDm7ARg7Hg3g==
X-CSE-MsgGUID: Fq7zzvSWS0i0GXMa02PTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7714264"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2026 11:54:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ8xv-00000000tKR-3l9B;
	Sun, 08 Nov 2026 19:54:11 +0000
Date: Mon, 09 Nov 2026 03:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bod:linux-7.4-rc1-ife-v1 74/102]
 drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous
 prototype for 'vfe_comp_group_output'
Message-ID: <202611090347.HXMZopae-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611090347.HXMZopae-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090347.HXMZopae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090347.HXMZopae-lkp@intel.com/

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
