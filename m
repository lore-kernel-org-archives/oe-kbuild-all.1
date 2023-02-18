Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD7378
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 01:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676683603; x=1708219603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klTv/B8kMWWmI+bjPlusLUZMofk1Z9qsVeUNhurlCSo=;
  b=XK67w8h9MyjRyGUyKcjQrkBCZvSOFRsWYtY9l3EYM/N7A3jY3BD2nvPJ
   Asho+l5rq9NVwq+bJq0U27I/XTjGpoPT0x+dZSdb4Qmn/rFON0iaWcU6r
   143KLvqf5JI+bujKRagPryHXBxYd48AM4zeBYXUCgUoCNJCglWGo3RAQd
   UpgCScixwhrAGKOMZhcwW804qfZBp4WoFUqO1J6OCzAX6mQAcM9Nbp/ZN
   yaxKKm7TPNwjTwXcW/eXmps0bWZJ2xqnf7+QnN6l0ek/geSS0zDarqGpM
   2YUyIBSG1Xq/792KphgnzLPQrbaqhG0kjupr31CMx9OVt6naPrWvWhb7D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="334329191"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="334329191"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 17:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739446190"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="739446190"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 17:26:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTBzs-000ByP-0w;
	Sat, 18 Feb 2023 01:26:40 +0000
Date: Sat, 18 Feb 2023 09:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:huge-bufs 1/2] io_uring/rsrc.c:1255:17: error: implicit
 declaration of function 'bvec_set_page'; did you mean 'bvec_iter_page'?
Message-ID: <202302180904.LGnCdGDx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux huge-bufs
head:   bd037ecf4740d89242fe180de3c8514c60b6976f
commit: e3415ec0fc67ecba22d092261b752c4326f3f513 [1/2] huge
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230218/202302180904.LGnCdGDx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/isilence/linux/commit/e3415ec0fc67ecba22d092261b752c4326f3f513
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence huge-bufs
        git checkout e3415ec0fc67ecba22d092261b752c4326f3f513
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180904.LGnCdGDx-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/rsrc.c: In function 'io_sqe_buffer_register':
>> io_uring/rsrc.c:1255:17: error: implicit declaration of function 'bvec_set_page'; did you mean 'bvec_iter_page'? [-Werror=implicit-function-declaration]
    1255 |                 bvec_set_page(&imu->bvec[0], pages[0], size, off);
         |                 ^~~~~~~~~~~~~
         |                 bvec_iter_page
   At top level:
   io_uring/rsrc.c:1108:12: warning: 'io_buffer_account_pin' defined but not used [-Wunused-function]
    1108 | static int io_buffer_account_pin(struct io_ring_ctx *ctx, struct page **pages,
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1255 io_uring/rsrc.c

  1200	
  1201	static int io_sqe_buffer_register(struct io_ring_ctx *ctx, struct iovec *iov,
  1202					  struct io_mapped_ubuf **pimu,
  1203					  struct page **last_hpage)
  1204	{
  1205		struct io_mapped_ubuf *imu = NULL;
  1206		struct page **pages = NULL;
  1207		unsigned long off;
  1208		size_t size;
  1209		int ret, nr_pages, i;
  1210		bool huge = true;
  1211		struct page *huge_head;
  1212	
  1213		*pimu = ctx->dummy_ubuf;
  1214		if (!iov->iov_base)
  1215			return 0;
  1216	
  1217		ret = -ENOMEM;
  1218		pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
  1219					&nr_pages);
  1220		if (IS_ERR(pages)) {
  1221			ret = PTR_ERR(pages);
  1222			pages = NULL;
  1223			goto done;
  1224		}
  1225	
  1226		// ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
  1227		// if (ret) {
  1228		// 	unpin_user_pages(pages, nr_pages);
  1229		// 	goto done;
  1230		// }
  1231	
  1232		huge_head = compound_head(pages[0]);
  1233		for (i = 0; i < nr_pages; i++) {
  1234			if (!PageCompound(pages[i]) || compound_head(pages[i]) != huge_head) {
  1235				huge = false;
  1236				break;
  1237			}
  1238		}
  1239	
  1240		imu = kvmalloc(struct_size(imu, bvec, nr_pages), GFP_KERNEL);
  1241		if (!imu)
  1242			goto done;
  1243	
  1244		off = (unsigned long) iov->iov_base & ~PAGE_MASK;
  1245		size = iov->iov_len;
  1246		/* store original address for later verification */
  1247		imu->ubuf = (unsigned long) iov->iov_base;
  1248		imu->ubuf_end = imu->ubuf + iov->iov_len;
  1249		imu->nr_bvecs = nr_pages;
  1250		*pimu = imu;
  1251		ret = 0;
  1252	
  1253		if (huge) {
  1254			nr_pages = 1;
> 1255			bvec_set_page(&imu->bvec[0], pages[0], size, off);
  1256			imu->huge = true;
  1257			goto done;
  1258		}
  1259		for (i = 0; i < nr_pages; i++) {
  1260			size_t vec_len;
  1261	
  1262			vec_len = min_t(size_t, size, PAGE_SIZE - off);
  1263			imu->bvec[i].bv_page = pages[i];
  1264			imu->bvec[i].bv_len = vec_len;
  1265			imu->bvec[i].bv_offset = off;
  1266			off = 0;
  1267			size -= vec_len;
  1268		}
  1269	done:
  1270		if (ret)
  1271			kvfree(imu);
  1272		kvfree(pages);
  1273		return ret;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
