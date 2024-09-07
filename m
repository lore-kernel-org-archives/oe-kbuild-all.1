Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47261A55
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725702683; cv=none; b=KVdR6Pl/0Os5ZVweAXisfXDOJb82nbGS6I8OJ8dTQxh+1XOCY/fgTJ9RkmLw4+y9F3X0x3WkIeRXQ/NJUkl85VeYWTF7cVvbHTZiw7sw8bJbPBHwWdC8FgRLKJwGSTiHBSSh8+K1O2USA/Q5M3fIT6EXmymPC8QzQcZ9Khq09zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725702683; c=relaxed/simple;
	bh=eLdbSHhHUldOlU7clOgdTtM5V7oPGmx7gRcMeiShrcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VH6aRwVDzUvVXWvxGTEE5ohn0GnJu74olPBdDiUBYtfCgfjbb//aw3FOFd+A125Dv2x0loPYWUEk1AceWZzJNeVhH8WsX0ZJxf8VZ2cJPppopR0oX5v9bnwPJhNM0MQ1a5kjTHfDn8TCc8FPQjb/NEoDRKr1glOGSjcY9scvOG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+Ump30a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+Ump30a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725702681; x=1757238681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLdbSHhHUldOlU7clOgdTtM5V7oPGmx7gRcMeiShrcQ=;
  b=b+Ump30arghIGhzS3APWq243w/KQrvMIbTHkqdUOWoJylHSTXtLgqqJU
   eRtmZJf2IbOurt6X/r4OkPS3kWOY6a4JqXNBwMZ1tKqcElD9D7P5kXL80
   qBPOVaXeY/gKa8Ifdd1WNT/q6e0C17aqkoMMfjydePBuiwZI2A/ktinjX
   8RB5+xn+Led271czSCoImfFLnI1G+6HpEMRMAelPtQ73FOnB+mOFUms0q
   foVb6qJgMJr5Ae6engi2ooqe79sj89UBz8NksG1eWjGbfNzxXV+glSHLR
   D0vV2YiLOb+MQSuNY2MbudKPJ/S/xmVmiUPGmx38sWchUHVr4lxo5MyST
   w==;
X-CSE-ConnectionGUID: twRpbXrBRt29M2bfD40sSw==
X-CSE-MsgGUID: sBgr8WguSneghqv8hXvNlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24608176"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24608176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 02:51:19 -0700
X-CSE-ConnectionGUID: ACxtJWvzQTeBPTEGPihIPg==
X-CSE-MsgGUID: SW53rmb6Q02pOv13J73l2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66219885"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2024 02:51:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sms63-000COp-2l;
	Sat, 07 Sep 2024 09:51:11 +0000
Date: Sat, 7 Sep 2024 17:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 22/43]
 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:3: error: incomplete
 definition of type 'struct akcipher_req'
Message-ID: <202409071731.E3NVTy7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   9caef88739ac46b62a0e2d08d5b1d47c441d9655
commit: cbc2abb2d3b27b11f3a1659f904b0a5b9102ffe3 [22/43] crypto: virtio - Drop superfluous [as]kcipher_req pointer
config: arm-randconfig-004-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071731.E3NVTy7R-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071731.E3NVTy7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071731.E3NVTy7R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:3: error: incomplete definition of type 'struct akcipher_req'
                   container_of(vc_akcipher_req, struct akcipher_req, __ctx);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:451:74: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                            ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:40: note: forward declaration of 'struct akcipher_req'
                   container_of(vc_akcipher_req, struct akcipher_req, __ctx);
                                                        ^
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:3: error: offsetof of incomplete type 'struct akcipher_req'
                   container_of(vc_akcipher_req, struct akcipher_req, __ctx);
                   ^                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
           ((type *)(__mptr - offsetof(type, member))); })
                              ^        ~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                  ~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:40: note: forward declaration of 'struct akcipher_req'
                   container_of(vc_akcipher_req, struct akcipher_req, __ctx);
                                                        ^
>> drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:69:27: error: initializing 'struct akcipher_request *' with an expression of incompatible type 'void'
           struct akcipher_request *akcipher_req =
                                    ^
   3 errors generated.
--
>> drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:58:3: error: static assertion failed due to requirement '__builtin_types_compatible_p(struct virtio_crypto_sym_request, void *[]) || __builtin_types_compatible_p(struct virtio_crypto_sym_request, void)': pointer type mismatch in container_of()
                   container_of(vc_sym_req, struct skcipher_request, __ctx);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:2: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:58:3: note: expression evaluates to '0 || 0'
                   container_of(vc_sym_req, struct skcipher_request, __ctx);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:57: note: expanded from macro 'container_of'
           static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   1 error generated.


vim +70 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

    64	
    65	static void virtio_crypto_dataq_akcipher_callback(struct virtio_crypto_request *vc_req, int len)
    66	{
    67		struct virtio_crypto_akcipher_request *vc_akcipher_req =
    68			container_of(vc_req, struct virtio_crypto_akcipher_request, base);
  > 69		struct akcipher_request *akcipher_req =
  > 70			container_of(vc_akcipher_req, struct akcipher_req, __ctx);
    71		int error;
    72	
    73		switch (vc_req->status) {
    74		case VIRTIO_CRYPTO_OK:
    75			error = 0;
    76			break;
    77		case VIRTIO_CRYPTO_INVSESS:
    78		case VIRTIO_CRYPTO_ERR:
    79			error = -EINVAL;
    80			break;
    81		case VIRTIO_CRYPTO_BADMSG:
    82			error = -EBADMSG;
    83			break;
    84		default:
    85			error = -EIO;
    86			break;
    87		}
    88	
    89		/* actual length maybe less than dst buffer */
    90		akcipher_req->dst_len = len - sizeof(vc_req->status);
    91		sg_copy_from_buffer(akcipher_req->dst, sg_nents(akcipher_req->dst),
    92				    vc_akcipher_req->dst_buf, akcipher_req->dst_len);
    93		virtio_crypto_akcipher_finalize_req(vc_akcipher_req, akcipher_req, error);
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
