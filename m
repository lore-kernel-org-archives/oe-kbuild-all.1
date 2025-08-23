Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18EA4A08
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 00:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755910325; cv=none; b=hU9UlORmcRetVVJrZTV9IJ/en09Q3slb234DtZEM5pdwoLEnzmNRMn03MfsLruk3eFrmaUYoR3RGAE61ne151M2X1DaPvjcCUAoerFp/ZwSD/levdZ+C1F/eciMAbm/tsYWmm7in+/Schnqt+D92bAoi8bHpazQsopgkZD5x0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755910325; c=relaxed/simple;
	bh=htIj+tdwAGRh/13uZncvTZt9i3JCRujyIvLWJIWlD84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lleKb1qceYBtrcClg1Jf5q/9BhTi8IY6h8f9kIEOXaR2OIQK/5KunR7wN1OPgryxpGoBO39szlk4lZ8a3Q2xYRDTG8chhbAiGPdJGkQuWoJBzVRsXIAxvZjmUnUh9fBPjI2OVxVwjKVx0auppe+kvmu44fQR6TlldW/pkQ7t4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alVzdquk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alVzdquk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755910324; x=1787446324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htIj+tdwAGRh/13uZncvTZt9i3JCRujyIvLWJIWlD84=;
  b=alVzdquktNGHsWhs/2B5CSrwTVJ09ijwqfaYTlnUp8TKkZy6JDRj45OJ
   3ARPW5avJ1zO5fsdQEQ8TvCmHDgqUbGhsYL68jdTaUcaAzUSm8mhiJI8k
   nOZlHfwWH92v7ApNxbRjuORhMG7v9dAwa2YbZ3vcHM2Xg1J2zMFKx5WGb
   JeZue3T9HAdw1tugoZuHFgxqjBWrmvyfX93CrgcLb7ozC11DrluLVpShI
   i6R3iyqvcTuViAd515x6GGfJTZlPQ/MPDw1+tC7Mhmaxv92lv6E00pkd0
   1f7xkQcGUQPXaY6a2WBCoiu7nLSKIdaRS3dveWc1DMYO5GAiFfKBw9HsT
   g==;
X-CSE-ConnectionGUID: VD06eMBrQ9uuTf+oSDuf3A==
X-CSE-MsgGUID: rq9Tjq61TLSKdnLbHHFtdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68493331"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68493331"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 17:52:03 -0700
X-CSE-ConnectionGUID: kmNIgxTlQHuksdrp4vg/+w==
X-CSE-MsgGUID: kI8gXImzSIaKTv+nYywWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199713923"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Aug 2025 17:52:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upcUB-000Lyj-2g;
	Sat, 23 Aug 2025 00:51:59 +0000
Date: Sat, 23 Aug 2025 08:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3055/4234]
 sound/soc/qcom/qdsp6/audioreach.c:818:40: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202508230830.Rkp7HHbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: da9881d00153cc6d3917f6b74144b1d41b58338c [3055/4234] ASoC: qcom: audioreach: add support for SMECNS module
config: csky-randconfig-r121-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230830.Rkp7HHbG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508230830.Rkp7HHbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230830.Rkp7HHbG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/qcom/qdsp6/audioreach.c:81:45: sparse: sparse: array of flexible structures
>> sound/soc/qcom/qdsp6/audioreach.c:818:40: sparse: sparse: incorrect type in initializer (different base types) @@     expected int payload_size @@     got restricted __le32 [usertype] size @@
   sound/soc/qcom/qdsp6/audioreach.c:818:40: sparse:     expected int payload_size
   sound/soc/qcom/qdsp6/audioreach.c:818:40: sparse:     got restricted __le32 [usertype] size

vim +818 sound/soc/qcom/qdsp6/audioreach.c

   813	
   814	static int audioreach_set_module_config(struct q6apm_graph *graph,
   815						struct audioreach_module *module,
   816						struct audioreach_module_config *cfg)
   817	{
 > 818		int payload_size = module->data->size;
   819		struct gpr_pkt *pkt;
   820		int rc;
   821		void *p;
   822	
   823		pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
   824		if (IS_ERR(pkt))
   825			return PTR_ERR(pkt);
   826	
   827		p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
   828	
   829		memcpy(p, module->data->data, payload_size);
   830	
   831		rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
   832	
   833		kfree(pkt);
   834	
   835		return rc;
   836	}
   837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
