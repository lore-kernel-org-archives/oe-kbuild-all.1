Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA775916A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635846; cv=none; b=CNZeOnNE81tdoiIj/t/4ZOXllZIgQTrlXqGte3egdCmVio+Wqe8huVzvarGWjmPm341wzl1b/Up3cNA2lp+q6EdwFiUjmmr7pwQO9FvavBEKTMYZ1CYGpjycUvAvZA27AD/v1xSAu3T/y/Gq/SMKpPmDH5YjFlxDLTMfT6J9LJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635846; c=relaxed/simple;
	bh=BNKcXivIbyOw1KRKTpQf43nwoWlhSKJ72ckwHiV5IDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPgW1bt/JP9AStbPTzhsFv5DhWryYshzC9OGrd5l8P5nXtbbhBzoK1kOKJC7+/M+IUFVuxsYebjQyTNe34LIUcCg82a5vvI2Z4T56OPUcvZN4aJ3xOLeKDC2je8ECBrWQ8C7CV8yp3Sg7xUSfwMkIR/FHmaeJJrjIVoZFja87To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/RvHd2h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/RvHd2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709635845; x=1741171845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNKcXivIbyOw1KRKTpQf43nwoWlhSKJ72ckwHiV5IDo=;
  b=V/RvHd2h2gh/7rJKQeCBo3wqJKKQXcTll1ukI+FjlfspYyzMdslpzAc2
   GCe8GSfBliAVR5mnigwc/wn/9tj4TmqYC6K8yU847WcVk2I96VfI3wzQh
   h83U/fO5SPCKpa0RcAVfckP4IwcBaUW+yU2smdI65ebOg5cjgGuwPghY9
   sFwoRKOFco0AsJehwoJJ+yjFI6MnexO4E10E0R4Xciyb9mScZ7wrjd/4m
   PbDKuY4W55YM7m2/rqkjsgthIuM5HcJB2bCAZWMEi05lXx3w5SrE2GQJ2
   M5+lEDBVHimBPYKYM5y0ZXnbvLxeH8hkigtU/OBsbbZmi5upP8NRz/DAS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7947011"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7947011"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9242237"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2024 02:50:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhSNb-0003FT-0s;
	Tue, 05 Mar 2024 10:50:39 +0000
Date: Tue, 5 Mar 2024 18:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24881/27434]
 drivers/virtio/virtio_balloon.c:161:5: warning: no previous prototype for
 'virtballoon_free_page_report'
Message-ID: <202403051851.LKOUDr4r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 5624b6f64dffb17eb72a2c6277e78ae5e55a5cfb [24881/27434] virtio-balloon: add support for providing free page reports to host
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403051851.LKOUDr4r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051851.LKOUDr4r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051851.LKOUDr4r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_balloon.c:161:5: warning: no previous prototype for 'virtballoon_free_page_report' [-Wmissing-prototypes]
     161 | int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtballoon_free_page_report +161 drivers/virtio/virtio_balloon.c

   160	
 > 161	int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
   162					   struct scatterlist *sg, unsigned int nents)
   163	{
   164		struct virtio_balloon *vb =
   165			container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
   166		struct virtqueue *vq = vb->reporting_vq;
   167		unsigned int unused, err;
   168	
   169		/* We should always be able to add these buffers to an empty queue. */
   170		err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT | __GFP_NOWARN);
   171	
   172		/*
   173		 * In the extremely unlikely case that something has occurred and we
   174		 * are able to trigger an error we will simply display a warning
   175		 * and exit without actually processing the pages.
   176		 */
   177		if (WARN_ON_ONCE(err))
   178			return err;
   179	
   180		virtqueue_kick(vq);
   181	
   182		/* When host has read buffer, this completes via balloon_ack */
   183		wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
   184	
   185		return 0;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
