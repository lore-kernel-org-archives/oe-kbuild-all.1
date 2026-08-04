Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04F37E5D8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844090; cv=none; b=k6ASTB7DUIYhP6DHJ3Rf+Db9e2KkULDcc/TkjF3MUQ6D9e0VxZ6cDh+WvMN76SdbktgzLD5Onn3K4rkaeJfWmTIhxPN8xFaV3rAQQ6Mak02qmhDgXn6ycV7M4wvkGj6ucUa3N1u1QvbrbNb8uYiSV4PRAKXS9IoNLSV+cAj1JBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844090; c=relaxed/simple;
	bh=JwoZwaWcgk3dLGiIlzNOnK8H9tbXJ+2BcgglZlZBDIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m42PMH8MF7tLViLZRWHbz29meczS2XlpyuaEvuUnA9Q1r+WpNfN3RDTaJDGLdA/Tl5HG1cRbDSRRmdswPq5ksqlwbL3Yel+QXhdgSw7k/MNr377wp+zJgdM4Qcdm6HWf28XiAVMI98ARo2jKftyW7ljXm8nWTYruPaQ5h3muTaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkPt7s3w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkPt7s3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785844088; x=1817380088;
  h=date:from:to:cc:subject:message-id;
  bh=JwoZwaWcgk3dLGiIlzNOnK8H9tbXJ+2BcgglZlZBDIU=;
  b=kkPt7s3w61Lei0efWL91Wucq9t5MeUh2pFX4DPyZH6ikpBGAUxtAdc9Z
   Rg3waukI5q4zXpf308IWryuPsHHtfB4oCRjd3iLUqe02Bh9goc3K4M4m9
   W4DaNgIhqYanURKzB+lpBZMvqTflx9fLaq0YvreKCECxrRv8aPNy1hOQY
   01odxRY1ylS2M4Ptd6eKx2kitGKEFiMVHnMy3zb5+ZwQWF04o2mVtDFsD
   2YNsno1um/1WfZym7NKxNC1pdnlwZiWzmf9RzRBbmrtAhi7QpCPG7Zt8u
   5tgbTSJ5fDgF842GBZKOzirqChSsoRZqDIaBEYn0PwctP6DZaM8QP44gt
   A==;
X-CSE-ConnectionGUID: s9OPqLlDRPecsPUsWN+zFw==
X-CSE-MsgGUID: 3IegL2DnTlqU8+6IJ/Czbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86591148"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86591148"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:48:08 -0700
X-CSE-ConnectionGUID: cFnzyqIPTLKDGqlmUw1Vqg==
X-CSE-MsgGUID: OV2zU1NaRMmf12JqvGPm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="261556360"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2026 04:48:07 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrDcq-000000004AA-3isO;
	Tue, 04 Aug 2026 11:48:04 +0000
Date: Tue, 04 Aug 2026 13:48:00 +0200
From: kernel test robot <lkp@intel.com>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in drivers/iio/position/as5600.rs:131:
Message-ID: <202608041338.xVVgjxFW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Muchamad-Coirul-Anwar/i2c-rust-implement-SMBus-read-abstraction-via-kernel-io-Io-for-I2cClient/20260804-125421
head:   be2a9a8d572ce711db658595a40911d8d0b1e2d4
commit: be2a9a8d572ce711db658595a40911d8d0b1e2d4 iio: position: add Rust driver for ams AS5600
date:   7 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260804/202608041338.xVVgjxFW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041338.xVVgjxFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041338.xVVgjxFW-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/iio/position/as5600.rs:131:
                    Ok(IioVal::Int(angle as i32))
                }
                // IIO_CHAN_INFO_SCALE: radians per LSB, 2*pi / 4096 = 0.001533981.
   -            INFO_SCALE => {
   -                Ok(IioVal::IntPlusNano(0, 1533981))
   -            }
   +            INFO_SCALE => Ok(IioVal::IntPlusNano(0, 1533981)),
                _ => Err(EINVAL),
            }
        }
   make[2]: *** [Makefile:1993: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
