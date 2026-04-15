Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E44C4594A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272200; cv=none; b=Udv1F/np/UVrV89hfZ2rNdCOWu+drN0EE5y6YE9G5XXy+tKyQQ9t2mWazDajNGT2Nyoj62ISm9l+FSvd2M0XcXOXZZCtl3k4gcKjYhm5W6FFNPBXdIhlaq9Fi+tnFyACGKJsvKt4lYsaD34yW0JAoK5AsFj0Wvho52VtfR4WsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272200; c=relaxed/simple;
	bh=OATcNqOCU8D38wzxGOwm4JyDfEsIU36Spxy+65H0WWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmPaHxqzpBbWAzoMz85yptAa/IYYd7PciM7r1fZpu6Wx472s9bjKDQE28uLpm4ptoCuYRad4ClKl2DPKVtW3VNA5059+6BuCYwpTV68es/CQpwT0pVrmAtLDLfYhfeprwMXMSFHQZynGgK8RC29c9ApZAonFhzivvIW4cgLJXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIDVTr3L; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIDVTr3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776272199; x=1807808199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OATcNqOCU8D38wzxGOwm4JyDfEsIU36Spxy+65H0WWQ=;
  b=VIDVTr3L+iEjoXxeT2GXLCce/bRuu8WkMQXfZ1ihDBbwz10sLQrBaFKb
   /RyPDN1B9nZ8/3ZhFqYljpavJ5ShdMMdYSjAVSI3cJ2/DwYa5OGHJy4r5
   ha9CfQWzOeiRR02UVcvknVKjdjhXuqfoXs4E4NwmGC7UZYp8T0BOekMg6
   3HCkWBdFg7cszwf6sO9j6LdPN6IPkI52a2IyeV3vZgfS1WXJM0uOvZwfg
   MjV4LpumepZ2ky0JgUJO6FLeJLLpTAcww7mJ9L1rLTdnTDt3nfpa2riTA
   NDg04UOBnR2hCbJ9Ei9zXAJgpfMWzptlUTNwVsZzT5nMd6vn0kJo7uJY9
   g==;
X-CSE-ConnectionGUID: 8YK6e1kwRWuGV7ssgXkLVw==
X-CSE-MsgGUID: EuU6ghF4Sx2bY4sb2thd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="80858549"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="80858549"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 09:56:27 -0700
X-CSE-ConnectionGUID: RGzfqdf1QuiVxmfPfXnHPg==
X-CSE-MsgGUID: fhqtPobnQ7uExKMp6l5LTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="232214304"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 09:56:24 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD3XK-000000000jW-1JQ2;
	Wed, 15 Apr 2026 16:56:22 +0000
Date: Thu, 16 Apr 2026 00:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] virtio-mem: support Confidential Computing (CoCo)
 environments
Message-ID: <202604160022.yMqoL9MR-lkp@intel.com>
References: <20260401-coco-v1-1-b9c3072e2d9c@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401-coco-v1-1-b9c3072e2d9c@redhat.com>

Hi Marc-André,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c369299895a591d96745d6492d4888259b004a9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Andr-Lureau/virtio-mem-support-Confidential-Computing-CoCo-environments/20260414-201359
base:   c369299895a591d96745d6492d4888259b004a9e
patch link:    https://lore.kernel.org/r/20260401-coco-v1-1-b9c3072e2d9c%40redhat.com
patch subject: [PATCH RFC] virtio-mem: support Confidential Computing (CoCo) environments
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260416/202604160022.yMqoL9MR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160022.yMqoL9MR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160022.yMqoL9MR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_mem.c: In function 'virtio_mem_coco_set_encrypted':
>> drivers/virtio/virtio_mem.c:876:16: error: implicit declaration of function 'set_memory_encrypted' [-Wimplicit-function-declaration]
     876 |         return set_memory_encrypted((unsigned long)__va(addr), PFN_DOWN(size));
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_mem.c: In function 'virtio_mem_coco_set_decrypted':
>> drivers/virtio/virtio_mem.c:881:16: error: implicit declaration of function 'set_memory_decrypted' [-Wimplicit-function-declaration]
     881 |         return set_memory_decrypted((unsigned long)__va(addr), PFN_DOWN(size));
         |                ^~~~~~~~~~~~~~~~~~~~


vim +/set_memory_encrypted +876 drivers/virtio/virtio_mem.c

   868	
   869	/*
   870	 * In CoCo (TDX, SEV-SNP) environments, hotplugged memory must be explicitly
   871	 * accepted before use (private/encrypted), and converted to shared/decrypted
   872	 * before returning to the hypervisor on unplug.
   873	 */
   874	static int virtio_mem_coco_set_encrypted(uint64_t addr, uint64_t size)
   875	{
 > 876		return set_memory_encrypted((unsigned long)__va(addr), PFN_DOWN(size));
   877	}
   878	
   879	static int virtio_mem_coco_set_decrypted(uint64_t addr, uint64_t size)
   880	{
 > 881		return set_memory_decrypted((unsigned long)__va(addr), PFN_DOWN(size));
   882	}
   883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
