Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E981723
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716371967; cv=none; b=iDP5OC0qafxF+cvgp/F0yE6uzub6AxUH4oMmdEmFgZ6JGcpEVTQWmtSpYiOei7EjaXUc55BC6aeTZUny/OAqEyirod9fm7WEHEFDlUs5Bj1HKSdBJk3uSXf2SEYL6uiJTe9e0zYuXbJL/TNrFmTKpxsPZms/U5oKKglsQY7avHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716371967; c=relaxed/simple;
	bh=ds5hqfjO3ppcdLLD5em3gS/InmNXlcYUB6MzaskcVhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm+B5VxNjcJgHV9oEW5edLEZ4tgk3KTQE+JinOc+SidmPuyNEJasGl82/RUlT3O4dDS1F2XGp45GTyLu0ujruBUIY/75TI9xS8JrIru9bG6yVcv2aHgVcV06mD4oeQ/W70BRRUxZz3chD5vGMDzQ6ld5T58PqBGFsOxsiD67NZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIREQYST; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIREQYST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716371966; x=1747907966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ds5hqfjO3ppcdLLD5em3gS/InmNXlcYUB6MzaskcVhg=;
  b=OIREQYSTXF3x/CH1+Qs5dcWFzZrkARjlXFTAgUrF3+E8sS9CFBvjBH3T
   MveYgJ9BM+jOsnjBoKPDKH4oaTsciY1THKZRoTpX+HKrOUeNFKemt+OMi
   AlFgeJvrSfNjTENX8PiNeAcd2twhnUi0dptnj3Br7cCCBsE4808UFp8Gh
   1fjhtbJ+aLwZ/b8wIMdpwfE+PHa9t4uTa+XEZP/2kYDjDy39bgrP6kBY4
   nsP9YOjLVSU7niC8LyW6eesQuLktN92MO1maspfrJ1H1piceMu/gDrw3m
   TLsXiDMk+hPMiUtYv6jn5gsYyVjZEdgQhFx5Nn5QcF8Bl4NhjXgq0WkLJ
   Q==;
X-CSE-ConnectionGUID: /xsrPANxSB+w856sXWeCUQ==
X-CSE-MsgGUID: 13sVtkcwQV2oFwY80VxRXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16440363"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="16440363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 02:59:25 -0700
X-CSE-ConnectionGUID: Q/e0kzAaSaaWj6XUVUmDfg==
X-CSE-MsgGUID: XUC1ghAyQDWhPQBOVksoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="38188166"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2024 02:59:23 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9ikK-0001GN-0B;
	Wed, 22 May 2024 09:59:07 +0000
Date: Wed, 22 May 2024 17:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 3/9] fdt-select-board: Add test tool for selecting
 dtbs based on board-id
Message-ID: <202405221750.MQCRvIKn-lkp@intel.com>
References: <20240521-board-ids-v3-3-e6c71d05f4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-board-ids-v3-3-e6c71d05f4d2@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on e8f897f4afef0031fe618a8e94127a0934896aba]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/libfdt-board-id-Implement-board-id-scoring/20240522-024327
base:   e8f897f4afef0031fe618a8e94127a0934896aba
patch link:    https://lore.kernel.org/r/20240521-board-ids-v3-3-e6c71d05f4d2%40quicinc.com
patch subject: [PATCH RFC v3 3/9] fdt-select-board: Add test tool for selecting dtbs based on board-id
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240522/202405221750.MQCRvIKn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221750.MQCRvIKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221750.MQCRvIKn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/dtc/fdt-select-board.c: In function 'main':
>> scripts/dtc/fdt-select-board.c:119:22: warning: passing argument 1 of 'free' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     119 |                 free(fdt);
         |                      ^~~
   In file included from scripts/dtc/fdt-select-board.c:8:
   /usr/include/stdlib.h:687:25: note: expected 'void *' but argument is of type 'const void *'
     687 | extern void free (void *__ptr) __THROW;
         |                   ~~~~~~^~~~~
--
   scripts/dtc/fdt-select-board.c: In function 'main':
>> scripts/dtc/fdt-select-board.c:119:22: warning: passing argument 1 of 'free' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     119 |                 free(fdt);
         |                      ^~~
   In file included from scripts/dtc/fdt-select-board.c:8:
   /usr/include/stdlib.h:687:25: note: expected 'void *' but argument is of type 'const void *'
     687 | extern void free (void *__ptr) __THROW;
         |                   ~~~~~~^~~~~


vim +119 scripts/dtc/fdt-select-board.c

    48	
    49	int main(int argc, char *argv[])
    50	{
    51		int opt;
    52		char *input_filename = NULL;
    53		const void *fdt;
    54		const void *ref;
    55		int ref_node;
    56		int max_score = -1;
    57		const char *best_match = NULL;
    58		struct context ctx;
    59		int all = 0;
    60	
    61		while ((opt = util_getopt_long()) != EOF) {
    62			switch (opt) {
    63			case_USAGE_COMMON_FLAGS
    64	
    65			case 'a':
    66				all = 1;
    67				break;
    68			case 'r':
    69				input_filename = optarg;
    70				break;
    71			case 'v':
    72				verbose = 1;
    73				break;
    74			}
    75		}
    76	
    77		if (!input_filename)
    78			usage("missing reference file");
    79	
    80		argv += optind;
    81		argc -= optind;
    82	
    83		if (argc <= 0)
    84			usage("missing candidate dtbs");
    85	
    86		ref = utilfdt_read(input_filename, NULL);
    87		if (!ref) {
    88			fprintf(stderr, "failed to read reference %s\n", input_filename);
    89			return -1;
    90		}
    91	
    92		ref_node = fdt_path_offset(ref, "/board-id");
    93		if (ref_node < 0) {
    94			fprintf(stderr, "reference blob doesn't have a board-id\n");
    95			return -1;
    96		}
    97	
    98		ctx.fdt = ref;
    99		ctx.node = ref_node;
   100	
   101		for (; argc > 0; --argc, ++argv) {
   102			int score;
   103	
   104			fdt = utilfdt_read(*argv, NULL);
   105			if (!fdt) {
   106				fprintf(stderr, "failed to read %s\n", *argv);
   107				return -1;
   108			}
   109	
   110			score = fdt_board_id_score(fdt, get_board_id, &ctx);
   111			if (verbose || (score > 0 && all))
   112				printf("%s: %d\n", *argv, score);
   113	
   114			if (score > max_score) {
   115				max_score = score;
   116				best_match = *argv;
   117			}
   118	
 > 119			free(fdt);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
