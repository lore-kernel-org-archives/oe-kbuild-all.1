Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96193909BC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772513180; cv=none; b=LhHOmlh4jIHd6Y13x4KVEHsSjGpFljp71UDTm7Szv92gnRwA21p6UaMvw0bBYvK9Tc9NZklQy2GX2vrjeUI5r27B6dJ3PLnZS+pyk22vm6Z7SlYzm4EtPdpSufo76cx9LH66nJ5SZ/IqCE2fj2nhW9PDySRmbmRj+9dJ0kzhofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772513180; c=relaxed/simple;
	bh=kOo76ZLsd1kh/bLWuNDcUz+EW2f7mGsQcPH5ACYHynM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmcyjoYmgNg1uSu0aN5jWyg1UZpyNuOA3OUUuq9phLA/OwH5JniWmLRv4SVF+zTk0PczRWmSzgCfS3plEM2WY+ifbOU7oZu7MEAc6cR+ztPYMHXF91E11kO+oSURTeUr0+6S7jN/2vdumIK1uo7et8E+BKPFyKay984Kk1z6LUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cj63YHM/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cj63YHM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772513176; x=1804049176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kOo76ZLsd1kh/bLWuNDcUz+EW2f7mGsQcPH5ACYHynM=;
  b=cj63YHM/XKMwubzEkyfAB5yTCSOcNOV1e2uhrRTVRQPLXMYAHUb8Pc5z
   91Arvj0YAcOYhRWXdQ28Pa4n03xJABGU0YgqPZjI+XLJkE5BCPdXuPzkX
   8b5JdUsZazBNmANi3lGi1MCnCn7kZJnzTfuOYqv/q3vOi329MUUhLJnkq
   xqPOotzScdnWyp+Us2MtPKX4Twa+YPUET6yPOVH6Zx3gUkaGkH1HmNz08
   1/brmQ0CSqVxwRpXmWHskpS+lprw0g2E8wm+RO6rgHrqN1u0hNP1I5ZkP
   2Mg3B0Gz6pYmCRE0S3f2yJ3LliAfxajkWu7y+T1Koj5i9YpXfKAkL0U2W
   g==;
X-CSE-ConnectionGUID: XDrN1MD2S32KKaYVZekvpQ==
X-CSE-MsgGUID: bnzDbu2oR++aSb++91jBEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="61106498"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="61106498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 20:46:15 -0800
X-CSE-ConnectionGUID: DGDmdfchQKetmhBPxec9GQ==
X-CSE-MsgGUID: FHwNQAcaTRWHSqEJmnn0gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="248362759"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 20:46:13 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxHe6-000000001NN-3tzR;
	Tue, 03 Mar 2026 04:46:10 +0000
Date: Tue, 3 Mar 2026 05:45:42 +0100
From: kernel test robot <lkp@intel.com>
To: javen <javen_xu@realsil.com.cn>, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Javen Xu <javen_xu@realsil.com.cn>
Subject: Re: [PATCH v1] rtl_pci: add support for Realtek management device
Message-ID: <202603030549.R78qeiGD-lkp@intel.com>
References: <20260303030106.1335-1-javen_xu@realsil.com.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303030106.1335-1-javen_xu@realsil.com.cn>

Hi javen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.0-rc2 next-20260302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/javen/rtl_pci-add-support-for-Realtek-management-device/20260303-110319
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260303030106.1335-1-javen_xu%40realsil.com.cn
patch subject: [PATCH v1] rtl_pci: add support for Realtek management device
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603030549.R78qeiGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603030549.R78qeiGD-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/misc/rtl_pci.c: 11 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
