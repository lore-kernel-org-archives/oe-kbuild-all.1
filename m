Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D6645
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 01:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GT95YRN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699405333; x=1730941333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oL1xz9jPtcvrSsMtXPH0SCS7LV8IMHnULjDJtXlfWyM=;
  b=GT95YRN+yVRITf6g8f6iyW9M1+EkqYwVj7zb1eC39309KOVT3wJXgRA6
   D6Wnq/HgYxsmuB/pfywfA1g6GmJNvGWwEmn8UCPgRvRJT0Zuv1DsfDUK8
   /DKNNKo3+WgzGQywKpiLFQp/Y5nzwSvAk7TP2DjNefX8KfZCXMn8B67ZD
   zsdwKk1YPOOATKZrb4NmcRHaoKCKCD8Xc3yID8/T3jEOqCU3H/7gGhhpq
   MXUDg/gJHHxg5zCpCWyZjcCUPaOudx+SW7TvM5j8ewgway5AJNlV84gAj
   tNJGD+XlG+uW3gSSp3OuUtE9ywLpg08OaYw00f4xjWTawhGlXwIHqQgZD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393579782"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="393579782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 17:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797847803"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="797847803"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Nov 2023 17:02:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0WxM-0007XA-19;
	Wed, 08 Nov 2023 01:02:08 +0000
Date: Wed, 8 Nov 2023 08:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [hverkuil-media-tree:for-v6.8c 199/204]
 drivers/staging/media/rkvdec/rkvdec-hevc.c:429:83: warning: variable
 'new_value' set but not used
Message-ID: <202311080826.DOL8PLZS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.8c
head:   9c2abee4a6b8ceaf853c15f135d5fa28ae60d0a7
commit: 8c17b9a51c9d965ea28067f61fb321f2618dd5ed [199/204] media: rkvdec: Add HEVC backend
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231108/202311080826.DOL8PLZS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080826.DOL8PLZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080826.DOL8PLZS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/rkvdec/rkvdec-hevc.c: In function 'transpose_and_flatten_matrices':
>> drivers/staging/media/rkvdec/rkvdec-hevc.c:429:83: warning: variable 'new_value' set but not used [-Wunused-but-set-variable]
     429 |         int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
         |                                                                                   ^~~~~~~~~


vim +/new_value +429 drivers/staging/media/rkvdec/rkvdec-hevc.c

   416	
   417	/*
   418	 * Flip one or more matrices along their main diagonal and flatten them
   419	 * before writing it to the memory.
   420	 * Convert:
   421	 * ABCD         AEIM
   422	 * EFGH     =>  BFJN     =>     AEIMBFJNCGKODHLP
   423	 * IJKL         CGKO
   424	 * MNOP         DHLP
   425	 */
   426	static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
   427						   int matrices, int row_length)
   428	{
 > 429		int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
   430	
   431		matrix_size = row_length * row_length;
   432		for (i = 0; i < matrices; i++) {
   433			row = 0;
   434			x_offset = 0;
   435			matrix_offset = i * matrix_size;
   436			for (j = 0; j < matrix_size; j++) {
   437				y_offset = j - (row * row_length);
   438				rot_index = y_offset * row_length + x_offset;
   439				new_value = *(input + i * matrix_size + j);
   440				output[matrix_offset + rot_index] = *(input + i * matrix_size + j);
   441				if ((j + 1) % row_length == 0) {
   442					row += 1;
   443					x_offset += 1;
   444				}
   445			}
   446		}
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
