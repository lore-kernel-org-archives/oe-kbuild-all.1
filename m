Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168183;
	b=FCst4C6RI/8L76wdCGbObP1r7YUzaTWvDEGDBLQr2dT9/DYRuMWP1o7PD4hKAJXEVN28
	 cwa/doNGvr9MrUi3w/uHHweL16c1cwHfnEckIhxLeQqqU6+1W/Gblu+G38nym/BMIEr1f
	 wnoBF/jSiCZVvrJvOHsCWkaICRwKdi+mMjZr4WlqALLQA6RPmxcpe+Z9BXNuPjEGUcbdl
	 5bhFylNGkAsfsmIMYTg6p2ErzNTvpzqT2yuZSE5mTxjUQG2yPqldd7XOBW6KSzlVEZk8G
	 ncY4IGaMiLog6m5yjPS9091yxHFtx/QasanIboP7tsgwpblm2he0qH7E+KUNZul7g7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168183;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kWEMVsQbETx318ZwVQh42kCHpBMfNibucyixtNojCgE=;
	b=Ospv2TdK/sn97kaKZms0eQOx33HK3OUr8KxhOEEG1nE4X2U9KztPzkwBIzE7At60vZQ7
	 XQC3O49y2P8+QlXchb1aCDJYJd/lLQastKugYAZI4YV0IGQU7JrBelra0ChMLSeswVlN9
	 yZC86mCyy5RF9M0DVSjln5z26MeMZM2T+eUw/9HJsdSjdmIYHE6oJJg1S9QPQ34uWQKRE
	 KElil4gy/z5NvvmK6neOkJjFQwqlnO3Za7te4z444S85HLW45rUPejh3DU9Y5/EPB9qk0
	 lfMTDe+iJmoYyVWNqS3MU/QUyj3gvQBJFgKZISh4iTYjHtIaugPdkG0udgyksFO3DrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fDeHTJ2c;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5D606A321
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 20:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B5D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fDeHTJ2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794168182; x=1825704182;
  h=date:from:to:cc:subject:message-id;
  bh=6RIMOWH7iR6QdQAMWqRMTzlwIjJoUGz8kP5n0NT3PQo=;
  b=fDeHTJ2c9RmVJaUG0PBbrOq3hwta+WoFfr1GEXMHFdTO4JiGEfmBZH8d
   FqQ+71uR7LC0tZe7ioJFHnTSC+aUf4OUKyBns+XX5J7cnB5+7SUPri9Lv
   2EePt77czOg3TOI0V/suTt6r6jqBOfHlLilpD/t/CjpXB3sdsBO8fKvEO
   xnWX5bEXuyJOqKYpFPAzMzUvAq2w5vTrc2XQzUhggFZb1d7JvQrhyaDeR
   frpsUvd4xds6DXyTRRdi4bViO+igA7uOJj5CvZqZ53Egmo3H90zNRwDL9
   Og2BYc5jwDSbPWbkPpjO5QG3DbPuxYHBxc60AK/KXx0TDqkJw/wOvlANR
   g==;
X-CSE-ConnectionGUID: IyBy5VOQQIaJqXkJrgKWQw==
X-CSE-MsgGUID: Zj7glZZHQG+gu9MX+0iS6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2905356"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2905356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 12:03:01 -0800
X-CSE-ConnectionGUID: LvCbu/r0QsGLYbrDx0ZOvQ==
X-CSE-MsgGUID: A5+UuJ6DSxWdl7PaOqQoxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7840658"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2026 12:02:59 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ96P-00000000BhV-07H7;
	Sun, 08 Nov 2026 20:02:57 +0000
Date: Sun, 08 Nov 2026 21:02:45 +0100
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bod:linux-7.4-rc1-ife-v1 74/102]
 drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous
 prototype for function 'vfe_comp_group_output'
Message-ID: <202611082051.2b1i5zeL-lkp@intel.com>
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
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611082051.2b1i5zeL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611082051.2b1i5zeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611082051.2b1i5zeL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous prototype for function 'vfe_comp_group_output' [-Wmissing-prototypes]
    5110 | struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
         |                    ^
   drivers/media/platform/qcom/camss/camss.c:5110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5110 | struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
         | ^
         | static 
   1 warning generated.


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
