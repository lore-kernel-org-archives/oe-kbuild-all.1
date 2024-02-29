Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864013F437
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 20:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709238762; cv=none; b=HypYlwHPpKOXOTOKzv64bSHmLoTGnwFUXxDM40od4SUxJ2dbeNNywr47wBwdyI0Ix9SljixQQDMGsPEfddVEJTLwpXiv8yhHQ1uDB9Q1JT+8iS/2XkBfjXrUU5/Y7N+VQAqltmEetD/afp8DXAdNOoMkN47oPS30qyVLXoC9V2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709238762; c=relaxed/simple;
	bh=OhhHStwPnH7OhQauTs2tDGJZDRVI6bZmEwo72FUSCPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhAntTiEm6rUTu+A4usQdQrzLRfVYZDe57lesSnvggdY1JO7SWXVZDwjfAZVVeYCXJTrM/4sbjuJUV3SEl3FpUUtJYwxYU0UOx5ryxV4rrnnyhfHIni6Z2rGUjVXfmYh3c2uq7OlGskMydTEGi+ZTkNNE15Cm9Z1gXwlyUqXaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+JabqN1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+JabqN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709238760; x=1740774760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OhhHStwPnH7OhQauTs2tDGJZDRVI6bZmEwo72FUSCPE=;
  b=G+JabqN1Y9u1OTo9tiYDgLLOK/1FGtQpjrDsnmzEBvOA7lDp5vdQCe4B
   K6IzgeiZkMxhKpn+hLcKlPparrVgb7D7mUug9oN9hGvOWmMUHkDc+51Zm
   szOH1sjLmVkPekvRLPwPbJbbJVmmNKdRzAkgQtuOiSa+MtPGCCY3Und2w
   eOXlPGDCxy8woT2Kd9a8vJOj9xjmlMsQh3iSJzZ5/a5SEeO7QXbqku0D5
   YFLHXSDOqJoyzay7kewfMTv5UuJWN4u0jJIdz6OtcUsHzp9co1AolTV3i
   ewkeJgacjJkDx0kGiMJ1Pnk/1jIkEGq2SXe1FFXfnWPVUlpri9+PGSUcM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6698054"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6698054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 12:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12633242"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Feb 2024 12:32:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfn4n-000DH9-2T;
	Thu, 29 Feb 2024 20:32:21 +0000
Date: Fri, 1 Mar 2024 04:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kui-Feng Lee <thinker.li@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [linux-next:master 5519/11156] kernel/bpf/bpf_struct_ops.c:247:16:
 warning: bitwise operation between different enumeration types ('enum
 bpf_type_flag' and 'enum bpf_reg_type')
Message-ID: <202403010423.0vNdUDBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 1611603537a4b88cec7993f32b70c03113801a46 [5519/11156] bpf: Create argument information for nullable arguments.
config: s390-randconfig-r133-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010423.0vNdUDBW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403010423.0vNdUDBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010423.0vNdUDBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:778:47: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     778 |         RET_PTR_TO_TCP_SOCK_OR_NULL     = PTR_MAYBE_NULL | RET_PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:779:50: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     779 |         RET_PTR_TO_SOCK_COMMON_OR_NULL  = PTR_MAYBE_NULL | RET_PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:781:49: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     781 |         RET_PTR_TO_DYNPTR_MEM_OR_NULL   = PTR_MAYBE_NULL | RET_PTR_TO_MEM,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   include/linux/bpf.h:782:45: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     782 |         RET_PTR_TO_BTF_ID_OR_NULL       = PTR_MAYBE_NULL | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:783:43: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_return_type') [-Wenum-enum-conversion]
     783 |         RET_PTR_TO_BTF_ID_TRUSTED       = PTR_TRUSTED    | RET_PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~    ^ ~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:894:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     894 |         PTR_TO_MAP_VALUE_OR_NULL        = PTR_MAYBE_NULL | PTR_TO_MAP_VALUE,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   include/linux/bpf.h:895:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     895 |         PTR_TO_SOCKET_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_SOCKET,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/bpf.h:896:46: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     896 |         PTR_TO_SOCK_COMMON_OR_NULL      = PTR_MAYBE_NULL | PTR_TO_SOCK_COMMON,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:897:44: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     897 |         PTR_TO_TCP_SOCK_OR_NULL         = PTR_MAYBE_NULL | PTR_TO_TCP_SOCK,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/bpf.h:898:42: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     898 |         PTR_TO_BTF_ID_OR_NULL           = PTR_MAYBE_NULL | PTR_TO_BTF_ID,
         |                                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   In file included from kernel/bpf/bpf_struct_ops.c:5:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/bpf/bpf_struct_ops.c:5:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/bpf/bpf_struct_ops.c:5:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/bpf/bpf_struct_ops.c:247:16: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
     247 |                         PTR_TRUSTED | PTR_TO_BTF_ID | PTR_MAYBE_NULL;
         |                         ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   38 warnings generated.


vim +247 kernel/bpf/bpf_struct_ops.c

   153	
   154	/* Prepare argument info for every nullable argument of a member of a
   155	 * struct_ops type.
   156	 *
   157	 * Initialize a struct bpf_struct_ops_arg_info according to type info of
   158	 * the arguments of a stub function. (Check kCFI for more information about
   159	 * stub functions.)
   160	 *
   161	 * Each member in the struct_ops type has a struct bpf_struct_ops_arg_info
   162	 * to provide an array of struct bpf_ctx_arg_aux, which in turn provides
   163	 * the information that used by the verifier to check the arguments of the
   164	 * BPF struct_ops program assigned to the member. Here, we only care about
   165	 * the arguments that are marked as __nullable.
   166	 *
   167	 * The array of struct bpf_ctx_arg_aux is eventually assigned to
   168	 * prog->aux->ctx_arg_info of BPF struct_ops programs and passed to the
   169	 * verifier. (See check_struct_ops_btf_id())
   170	 *
   171	 * arg_info->info will be the list of struct bpf_ctx_arg_aux if success. If
   172	 * fails, it will be kept untouched.
   173	 */
   174	static int prepare_arg_info(struct btf *btf,
   175				    const char *st_ops_name,
   176				    const char *member_name,
   177				    const struct btf_type *func_proto,
   178				    struct bpf_struct_ops_arg_info *arg_info)
   179	{
   180		const struct btf_type *stub_func_proto, *pointed_type;
   181		const struct btf_param *stub_args, *args;
   182		struct bpf_ctx_arg_aux *info, *info_buf;
   183		u32 nargs, arg_no, info_cnt = 0;
   184		u32 arg_btf_id;
   185		int offset;
   186	
   187		stub_func_proto = find_stub_func_proto(btf, st_ops_name, member_name);
   188		if (!stub_func_proto)
   189			return 0;
   190	
   191		/* Check if the number of arguments of the stub function is the same
   192		 * as the number of arguments of the function pointer.
   193		 */
   194		nargs = btf_type_vlen(func_proto);
   195		if (nargs != btf_type_vlen(stub_func_proto)) {
   196			pr_warn("the number of arguments of the stub function %s__%s does not match the number of arguments of the member %s of struct %s\n",
   197				st_ops_name, member_name, member_name, st_ops_name);
   198			return -EINVAL;
   199		}
   200	
   201		if (!nargs)
   202			return 0;
   203	
   204		args = btf_params(func_proto);
   205		stub_args = btf_params(stub_func_proto);
   206	
   207		info_buf = kcalloc(nargs, sizeof(*info_buf), GFP_KERNEL);
   208		if (!info_buf)
   209			return -ENOMEM;
   210	
   211		/* Prepare info for every nullable argument */
   212		info = info_buf;
   213		for (arg_no = 0; arg_no < nargs; arg_no++) {
   214			/* Skip arguments that is not suffixed with
   215			 * "__nullable".
   216			 */
   217			if (!btf_param_match_suffix(btf, &stub_args[arg_no],
   218						    MAYBE_NULL_SUFFIX))
   219				continue;
   220	
   221			/* Should be a pointer to struct */
   222			pointed_type = btf_type_resolve_ptr(btf,
   223							    args[arg_no].type,
   224							    &arg_btf_id);
   225			if (!pointed_type ||
   226			    !btf_type_is_struct(pointed_type)) {
   227				pr_warn("stub function %s__%s has %s tagging to an unsupported type\n",
   228					st_ops_name, member_name, MAYBE_NULL_SUFFIX);
   229				goto err_out;
   230			}
   231	
   232			offset = btf_ctx_arg_offset(btf, func_proto, arg_no);
   233			if (offset < 0) {
   234				pr_warn("stub function %s__%s has an invalid trampoline ctx offset for arg#%u\n",
   235					st_ops_name, member_name, arg_no);
   236				goto err_out;
   237			}
   238	
   239			if (args[arg_no].type != stub_args[arg_no].type) {
   240				pr_warn("arg#%u type in stub function %s__%s does not match with its original func_proto\n",
   241					arg_no, st_ops_name, member_name);
   242				goto err_out;
   243			}
   244	
   245			/* Fill the information of the new argument */
   246			info->reg_type =
 > 247				PTR_TRUSTED | PTR_TO_BTF_ID | PTR_MAYBE_NULL;
   248			info->btf_id = arg_btf_id;
   249			info->btf = btf;
   250			info->offset = offset;
   251	
   252			info++;
   253			info_cnt++;
   254		}
   255	
   256		if (info_cnt) {
   257			arg_info->info = info_buf;
   258			arg_info->cnt = info_cnt;
   259		} else {
   260			kfree(info_buf);
   261		}
   262	
   263		return 0;
   264	
   265	err_out:
   266		kfree(info_buf);
   267	
   268		return -EINVAL;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
