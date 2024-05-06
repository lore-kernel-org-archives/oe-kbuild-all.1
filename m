Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E332181
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 00:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714954169; cv=none; b=LiGM10VbleHa4SEypkdciVKTFgTRUiIaZcTwCME7BmQwWkuNMwPgaT7SXJe+yNaaRq0MCxxLvYnzf7RqkCP/OSfzt3HaTHALSM/dR6FoLtzLhdtM6Yuvd8Cek9esGpc5KVVhkmkicEA29dcjztuAz+rTETH5woIn3/p29PHt0XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714954169; c=relaxed/simple;
	bh=dbH+DjhnstdeRsOlGe0AGj84TpAydTf1O5+4gkJnrKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVR2X545j4lcvD7iPK+1WF/WpwhgdSehswuQj75uqF5rEVWITWoXYYm1mWGKoDmufxVro1oiVUEd/3qdX11P7sYPQtQIqWcwbTX/5mS/+qBPr1AbsBpDUG2aDcv6c9+pRJW2rQkp+65+lSGUiCaTQ/DtjhJrL+v6xNqk6Ti9pbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfVZ2gTm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfVZ2gTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714954168; x=1746490168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbH+DjhnstdeRsOlGe0AGj84TpAydTf1O5+4gkJnrKQ=;
  b=gfVZ2gTmg0xEdslLOFfh5nqlrUDDeeZp0L8pYhnMnnZl09ZGJd5yDZNP
   TFrkH52NwHr5j19lzk6oyFg3QO9OytaGKmMaQ5L6dMc4qWTWg1NQKl3WO
   r50rlX5/UMSCFCkb1CA+JJEpKZTF6piY9BTudTlevpYfZN0yaEPbgPO+0
   jmwqOlphFxwrozNbQXGUnR2fgNCpYnap9E3NJTGczSDNwehIRmNxn5aKp
   qk3YsxS2dfNuN2BD0+g3/JJNmL08+kCh81175j8lh9Bv1Ms5MqAlc/xck
   rKhqbJ3Uepfhp+aBSHcHUsLmLjOywp8TMvdgSG98ahdl8GENNFt2GtlUy
   Q==;
X-CSE-ConnectionGUID: oG9p9//hRk6IE7UDxCIGbQ==
X-CSE-MsgGUID: 6iVzmb9qRW+PgY6BLpKvjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10809353"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10809353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 17:09:27 -0700
X-CSE-ConnectionGUID: FNu7jg1DRPGkkDnYxL6ODg==
X-CSE-MsgGUID: x/HnzgArSBCj3uAgR5cdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32662670"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 May 2024 17:09:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3lv1-0000Ii-1X;
	Mon, 06 May 2024 00:09:23 +0000
Date: Mon, 6 May 2024 08:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3404/30000]
 drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.c:285:5:
 warning: function '_PrintString' might be a candidate for 'gnu_printf'
 format attribute
Message-ID: <202405060732.w4EYMpXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: 7a0838db513265bf1d52b227e1558ae767b517f2 [3404/30000] MGS-6060 gpu-viv: sync 20201116 patch release
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240506/202405060732.w4EYMpXH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060732.w4EYMpXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060732.w4EYMpXH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm/mm: No such file or directory [-Wmissing-include-dirs]
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.c: In function '_PrintString':
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.c:285:5: warning: function '_PrintString' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     285 |     len += gcmkVSPRINTF(Buffer + len, Size - len, Message, Data);
         |     ^~~
   drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.c: In function 'gckOS_Dump':
>> drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.c:993:5: warning: function 'gckOS_Dump' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     993 |     len = gcmkVSPRINTF(buffer, gcmSIZEOF(buffer) - 2, Format, &args);
         |     ^~~


vim +285 drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_debug.c

3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  268  
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  269  static gctUINT
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  270  _PrintString(
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  271      IN gcsBUFFERED_OUTPUT_PTR OutputBuffer,
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  272      IN gctINT Indent,
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  273      IN gctCONST_STRING Message,
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  274      IN gctPOINTER Data,
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  275      IN char Buffer[],
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  276      IN gctUINT Size
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  277      )
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  278  {
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  279      gctINT len;
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  280  
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  281      /* Append the indent string. */
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  282      len = _AppendIndent(Indent, Buffer, Size);
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  283  
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  284      /* Format the string. */
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23 @285      len += gcmkVSPRINTF(Buffer + len, Size - len, Message, Data);
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  286      Buffer[len] = '\0';
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  287  
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  288      /* Add end-of-line if missing. */
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  289      if (Buffer[len - 1] != '\n')
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  290      {
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  291          Buffer[len++] = '\n';
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  292          Buffer[len] = '\0';
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  293      }
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  294  
41dc8391b73c36 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Minjie Zhuang 2019-09-23  295      return (gctUINT)len;
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  296  }
3dcab85234f3a4 drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_debug.c Xianzhong     2019-01-29  297  

:::::: The code at line 285 was first introduced by commit
:::::: 41dc8391b73c360c2ba5a842e6eea0a5717db2ce gpu:Integrate 6.4.0 kernel driver for Linux L5.x

:::::: TO: Minjie Zhuang <minjie.zhuang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
