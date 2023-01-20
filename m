Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E017C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674184061; x=1705720061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l+mSYcjCs3VtHdH4MTzk9fTsaIZXQ5VDUn8clsV5ONw=;
  b=T9loOMUrSlEGJ+vEBRAzPzFV41LYAePfRznOyDu7Eu8ccMgHtfU4W0OE
   orjdxKWHUVeOY5IAtfIcj6eWBWiDWb7glTFQB4Uq2ECsp9QuHfNWqNzy/
   evTYHV9/H8jxutqErS6nBqFmrnrvNuQhs3TgmgrQVmSvYLDnmKbuTIRjK
   e77oLshU7E50Be5IyS9FSm/jiRbQxh97n6NmzXALGhRkUSe8LUMSxKYC3
   4arnOEm8K8o0SY1RdbSXCDm4evmx1eKMtHAR6WUhNeYWDSaFFJPtTLyQ0
   avImivNmfDGRovwlq1g/TtspgCxJwk1gJ4L9GfpR6zuqq+H60cm/5HnwR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411726041"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="411726041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 19:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692719398"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="692719398"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 19:07:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIhke-00027Z-13;
	Fri, 20 Jan 2023 03:07:36 +0000
Date: Fri, 20 Jan 2023 11:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Babis Chalios <bchalios@amazon.es>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, amit@kernel.org, graf@amazon.de,
	Jason@zx2c4.com, xmarcalx@amazon.co.uk
Subject: Re: [PATCH 2/2] virtio-rng: add sysfs entries for leak detection
Message-ID: <202301201004.z1gRttwb-lkp@intel.com>
References: <20230119184349.74072-3-bchalios@amazon.es>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119184349.74072-3-bchalios@amazon.es>

Hi Babis,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babis-Chalios/virtio-rng-implement-entropy-leak-feature/20230120-024631
patch link:    https://lore.kernel.org/r/20230119184349.74072-3-bchalios%40amazon.es
patch subject: [PATCH 2/2] virtio-rng: add sysfs entries for leak detection
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230120/202301201004.z1gRttwb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/2a801d93b8225555e4cb293a173e2053870cb2d1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Babis-Chalios/virtio-rng-implement-entropy-leak-feature/20230120-024631
        git checkout 2a801d93b8225555e4cb293a173e2053870cb2d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/char/hw_random/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/virtio-rng.c:61:9: sparse: sparse: symbol 'virtrng_sysfs_read' was not declared. Should it be static?
>> drivers/char/hw_random/virtio-rng.c:76:5: sparse: sparse: symbol 'virtrng_sysfs_mmap' was not declared. Should it be static?
   drivers/char/hw_random/virtio-rng.c:106:5: sparse: sparse: symbol 'add_fill_on_leak_request' was not declared. Should it be static?
   drivers/char/hw_random/virtio-rng.c:120:5: sparse: sparse: symbol 'virtrng_fill_on_leak' was not declared. Should it be static?
   drivers/char/hw_random/virtio-rng.c:141:5: sparse: sparse: symbol 'add_copy_on_leak_request' was not declared. Should it be static?
   drivers/char/hw_random/virtio-rng.c:160:5: sparse: sparse: symbol 'virtrng_copy_on_leak' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
