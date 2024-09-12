Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3221C1AA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726168226; cv=none; b=c6xyFBT2m6XLpu1ZghZZgcuVJoBrLPLTu59H9AAidSrquiF5H3frjqMLNF30Q+lzQiIJ1V6Qk/+7Ys2Kw8pDEItmM6zOVrKavSi/ebyqPMpjjjAnYpjZ8GPhnwVtNRFIYOrrMAKws6zMXctQ33YVqLJZbzBuShIrZaPI8OER+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726168226; c=relaxed/simple;
	bh=ZyyJ8IMHQsUfbG/IsFD8AcfHJf7Gve4uYyKpgn5TCB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYzSWiSEfphkOFfbfJt8luad8+JgT+og4F1TbMpsIT0kcCEzi6rZpih+9aRh9u+XNdJSIHTwhX/eOmbTQ68EGiX0FPU6exiLVNLEikOzCTWSOZXi6yXNBlgAOgs9bpJ7/4emNT5RWLpEzayDcom58hs28b8vljKhERuwcNZy7/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRwSu+ET; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRwSu+ET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726168221; x=1757704221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZyyJ8IMHQsUfbG/IsFD8AcfHJf7Gve4uYyKpgn5TCB8=;
  b=nRwSu+ETAkdXxbmS9EuB3Xk1GBpeWb5aKPxaXO0G+QmjqjWauWm5VNV0
   9NUua6moWDcAfkOdqTfo6V0v0M1CtCirG3ieVY3AmJ6N0E7WL0cBrMDtv
   FRAVTYH1aXBt0NUq2V0mkBJ3Z3vkvD1/znmmxW//mGFuTt0R0zA926mIF
   WUfYbPYH8LVe+3F77dl8PTKSxYbWaz5xNhjTVY6x9pcvdLDTsWU5HoLVE
   pt22oR7zIMJVGl301KDRSZ9nKHmqJyyNjIO1WnakiDDXzS3xfkw/PsqI8
   SBEZ0mlG9zQTJh0IwuPDfU7wCG13Vs+TfO0kQUqzQYZL1zOuJlElsq+j9
   g==;
X-CSE-ConnectionGUID: 1dhVfURhSLGf2Ym7lIRIOA==
X-CSE-MsgGUID: 9Ms9eyOcSlSbaCEE5WuaCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24585720"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="24585720"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 12:10:19 -0700
X-CSE-ConnectionGUID: xZGV3f4hRM2/Pd3zFJkXNA==
X-CSE-MsgGUID: yu5hYNzyTDmo58NrprAAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="68328076"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 12:10:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sopCo-0005c0-2r;
	Thu, 12 Sep 2024 19:10:14 +0000
Date: Fri, 13 Sep 2024 03:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 10/11]
 drivers/gpu/drm/i915/display/intel_display.o: warning: objtool:
 skl_check_plane_surface()+0x1544: unreachable instruction
Message-ID: <202409130338.QDRIuD1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   6b967696c14913bc77f1720e179a47f00358a0c8
commit: 71f70987f97bd71c6ec99c544ffe477e584fdf12 [10/11] UPSTREAM: ubsan: remove overflow checks
config: x86_64-randconfig-003-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130338.QDRIuD1o-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130338.QDRIuD1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130338.QDRIuD1o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display.o: warning: objtool: skl_check_plane_surface()+0x1544: unreachable instruction


objdump-func vmlinux.o skl_check_plane_surface:
0000 00000000024d3010 <skl_check_plane_surface>:
0000  24d3010:	55                   	push   %rbp
0001  24d3011:	41 57                	push   %r15
0003  24d3013:	41 56                	push   %r14
0005  24d3015:	41 55                	push   %r13
0007  24d3017:	41 54                	push   %r12
0009  24d3019:	53                   	push   %rbx
000a  24d301a:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
0011  24d3021:	4c 8d bf a0 00 00 00 	lea    0xa0(%rdi),%r15
0018  24d3028:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0022  24d3032:	49 89 fe             	mov    %rdi,%r14
0025  24d3035:	4c 89 f8             	mov    %r15,%rax
0028  24d3038:	48 c1 e8 03          	shr    $0x3,%rax
002c  24d303c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0030  24d3040:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
0038  24d3048:	74 08                	je     24d3052 <skl_check_plane_surface+0x42>
003a  24d304a:	4c 89 ff             	mov    %r15,%rdi
003d  24d304d:	e8 00 00 00 00       	call   24d3052 <skl_check_plane_surface+0x42>	24d304e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0042  24d3052:	4d 8b a6 a0 00 00 00 	mov    0xa0(%r14),%r12
0049  24d3059:	4c 89 f7             	mov    %r14,%rdi
004c  24d305c:	e8 af 29 00 00       	call   24d5a10 <intel_plane_compute_gtt>
0051  24d3061:	85 c0                	test   %eax,%eax
0053  24d3063:	0f 85 4e 29 00 00    	jne    24d59b7 <skl_check_plane_surface+0x29a7>
0059  24d3069:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
0060  24d3070:	48 89 d8             	mov    %rbx,%rax
0063  24d3073:	48 c1 e8 03          	shr    $0x3,%rax
0067  24d3077:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
006b  24d307b:	84 c0                	test   %al,%al
006d  24d307d:	0f 85 8c 1f 00 00    	jne    24d500f <skl_check_plane_surface+0x1fff>
0073  24d3083:	80 3b 00             	cmpb   $0x0,(%rbx)
0076  24d3086:	0f 84 07 07 00 00    	je     24d3793 <skl_check_plane_surface+0x783>
007c  24d308c:	49 8d 5c 24 78       	lea    0x78(%r12),%rbx
0081  24d3091:	4c 89 bc 24 80 00 00 00 	mov    %r15,0x80(%rsp)
0089  24d3099:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
008e  24d309e:	4c 89 a4 24 98 00 00 00 	mov    %r12,0x98(%rsp)
0096  24d30a6:	48 89 d8             	mov    %rbx,%rax
0099  24d30a9:	48 c1 e8 03          	shr    $0x3,%rax
009d  24d30ad:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00a1  24d30b1:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
00a6  24d30b6:	74 08                	je     24d30c0 <skl_check_plane_surface+0xb0>
00a8  24d30b8:	48 89 df             	mov    %rbx,%rdi
00ab  24d30bb:	e8 00 00 00 00       	call   24d30c0 <skl_check_plane_surface+0xb0>	24d30bc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b0  24d30c0:	48 8b 03             	mov    (%rbx),%rax
00b3  24d30c3:	48 b9 01 00 00 00 00 00 40 00 	movabs $0x40000000000001,%rcx
00bd  24d30cd:	49 bd 04 00 00 00 00 00 00 01 	movabs $0x100000000000004,%r13
00c7  24d30d7:	48 89 9c 24 90 00 00 00 	mov    %rbx,0x90(%rsp)
00cf  24d30df:	48 c1 e8 02          	shr    $0x2,%rax
00d3  24d30e3:	48 39 c8             	cmp    %rcx,%rax
00d6  24d30e6:	0f 85 03 05 00 00    	jne    24d35ef <skl_check_plane_surface+0x5df>
00dc  24d30ec:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
00e4  24d30f4:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
00ec  24d30fc:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00f0  24d3100:	74 05                	je     24d3107 <skl_check_plane_surface+0xf7>
00f2  24d3102:	e8 00 00 00 00       	call   24d3107 <skl_check_plane_surface+0xf7>	24d3103: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00f7  24d3107:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
00fc  24d310c:	48 8b 83 a0 00 00 00 	mov    0xa0(%rbx),%rax
0103  24d3113:	48 8d 7b 60          	lea    0x60(%rbx),%rdi
0107  24d3117:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
010c  24d311c:	48 89 f8             	mov    %rdi,%rax
010f  24d311f:	48 c1 e8 03          	shr    $0x3,%rax
0113  24d3123:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0117  24d3127:	84 c0                	test   %al,%al
0119  24d3129:	0f 85 39 20 00 00    	jne    24d5168 <skl_check_plane_surface+0x2158>
011f  24d312f:	0f bf 43 62          	movswl 0x62(%rbx),%eax
0123  24d3133:	48 83 c3 64          	add    $0x64,%rbx
0127  24d3137:	89 84 24 a8 00 00 00 	mov    %eax,0xa8(%rsp)
012e  24d313e:	48 89 d8             	mov    %rbx,%rax
0131  24d3141:	48 c1 e8 03          	shr    $0x3,%rax
0135  24d3145:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0139  24d3149:	84 c0                	test   %al,%al
013b  24d314b:	0f 85 31 20 00 00    	jne    24d5182 <skl_check_plane_surface+0x2172>
0141  24d3151:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
0146  24d3156:	0f bf 43 02          	movswl 0x2(%rbx),%eax
014a  24d315a:	48 8d 59 48          	lea    0x48(%rcx),%rbx
014e  24d315e:	89 44 24 48          	mov    %eax,0x48(%rsp)
0152  24d3162:	48 89 d8             	mov    %rbx,%rax
0155  24d3165:	48 c1 e8 03          	shr    $0x3,%rax
0159  24d3169:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
015d  24d316d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0162  24d3172:	74 08                	je     24d317c <skl_check_plane_surface+0x16c>
0164  24d3174:	48 89 df             	mov    %rbx,%rdi
0167  24d3177:	e8 00 00 00 00       	call   24d317c <skl_check_plane_surface+0x16c>	24d3178: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
016c  24d317c:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
0171  24d3181:	48 8b 1b             	mov    (%rbx),%rbx
0174  24d3184:	48 83 c3 05          	add    $0x5,%rbx
0178  24d3188:	48 89 d8             	mov    %rbx,%rax
017b  24d318b:	48 c1 e8 03          	shr    $0x3,%rax
017f  24d318f:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0183  24d3193:	84 c0                	test   %al,%al
0185  24d3195:	0f 85 04 20 00 00    	jne    24d519f <skl_check_plane_surface+0x218f>
018b  24d319b:	0f b6 1b             	movzbl (%rbx),%ebx
018e  24d319e:	84 db                	test   %bl,%bl
0190  24d31a0:	0f 84 49 04 00 00    	je     24d35ef <skl_check_plane_surface+0x5df>
0196  24d31a6:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
019b  24d31ab:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
01a0  24d31b0:	45 31 f6             	xor    %r14d,%r14d
01a3  24d31b3:	48 8d 70 78          	lea    0x78(%rax),%rsi
01a7  24d31b7:	4c 8d ba fc 00 00 00 	lea    0xfc(%rdx),%r15
01ae  24d31be:	48 89 f1             	mov    %rsi,%rcx
01b1  24d31c1:	4d 89 fc             	mov    %r15,%r12
01b4  24d31c4:	48 89 34 24          	mov    %rsi,(%rsp)
01b8  24d31c8:	48 c1 e9 03          	shr    $0x3,%rcx
01bc  24d31cc:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
01c1  24d31d1:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
01c6  24d31d6:	c7 44 24 0c aa aa aa aa 	movl   $0xaaaaaaaa,0xc(%rsp)
01ce  24d31de:	c7 44 24 10 aa aa aa aa 	movl   $0xaaaaaaaa,0x10(%rsp)
01d6  24d31e6:	c7 84 24 b4 00 00 00 aa aa aa aa 	movl   $0xaaaaaaaa,0xb4(%rsp)
01e1  24d31f1:	c7 84 24 b0 00 00 00 aa aa aa aa 	movl   $0xaaaaaaaa,0xb0(%rsp)
01ec  24d31fc:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
01f0  24d3200:	74 0d                	je     24d320f <skl_check_plane_surface+0x1ff>
01f2  24d3202:	48 8b 3c 24          	mov    (%rsp),%rdi
01f6  24d3206:	e8 00 00 00 00       	call   24d320b <skl_check_plane_surface+0x1fb>	24d3207: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01fb  24d320b:	48 8b 34 24          	mov    (%rsp),%rsi
01ff  24d320f:	48 8b 06             	mov    (%rsi),%rax
0202  24d3212:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
0206  24d3216:	4c 39 e8             	cmp    %r13,%rax
0209  24d3219:	0f 85 e6 01 00 00    	jne    24d3405 <skl_check_plane_surface+0x3f5>
020f  24d321f:	d0 eb                	shr    %bl
0211  24d3221:	0f b6 c3             	movzbl %bl,%eax
0214  24d3224:	49 39 c6             	cmp    %rax,%r14
0217  24d3227:	0f 82 d8 01 00 00    	jb     24d3405 <skl_check_plane_surface+0x3f5>
021d  24d322d:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
0222  24d3232:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0227  24d3237:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
022b  24d323b:	74 08                	je     24d3245 <skl_check_plane_surface+0x235>
022d  24d323d:	48 89 df             	mov    %rbx,%rdi
0230  24d3240:	e8 00 00 00 00       	call   24d3245 <skl_check_plane_surface+0x235>	24d3241: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0235  24d3245:	48 8b 1b             	mov    (%rbx),%rbx
0238  24d3248:	48 83 c3 05          	add    $0x5,%rbx
023c  24d324c:	48 89 d8             	mov    %rbx,%rax
023f  24d324f:	48 c1 e8 03          	shr    $0x3,%rax
0243  24d3253:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0247  24d3257:	84 c0                	test   %al,%al
0249  24d3259:	0f 85 0b 02 00 00    	jne    24d346a <skl_check_plane_surface+0x45a>
024f  24d325f:	0f b6 03             	movzbl (%rbx),%eax
0252  24d3262:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
0257  24d3267:	44 89 f1             	mov    %r14d,%ecx
025a  24d326a:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
025f  24d326f:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
0264  24d3274:	d1 e8                	shr    %eax
0266  24d3276:	48 89 da             	mov    %rbx,%rdx
0269  24d3279:	29 c1                	sub    %eax,%ecx
026b  24d327b:	e8 70 c3 04 00       	call   251f5f0 <intel_fb_plane_get_subsampling>
0270  24d3280:	48 8d bc 24 b4 00 00 00 	lea    0xb4(%rsp),%rdi
0278  24d3288:	48 8d b4 24 b0 00 00 00 	lea    0xb0(%rsp),%rsi
0280  24d3290:	48 89 da             	mov    %rbx,%rdx
0283  24d3293:	44 89 f1             	mov    %r14d,%ecx
0286  24d3296:	e8 55 c3 04 00       	call   251f5f0 <intel_fb_plane_get_subsampling>
028b  24d329b:	8b 44 24 0c          	mov    0xc(%rsp),%eax
028f  24d329f:	8b 9c 24 b4 00 00 00 	mov    0xb4(%rsp),%ebx
0296  24d32a6:	44 8b ac 24 b0 00 00 00 	mov    0xb0(%rsp),%r13d
029e  24d32ae:	0f af d8             	imul   %eax,%ebx
02a1  24d32b1:	89 44 24 14          	mov    %eax,0x14(%rsp)
02a5  24d32b5:	8b 44 24 10          	mov    0x10(%rsp),%eax
02a9  24d32b9:	89 9c 24 b4 00 00 00 	mov    %ebx,0xb4(%rsp)
02b0  24d32c0:	44 0f af e8          	imul   %eax,%r13d
02b4  24d32c4:	89 44 24 50          	mov    %eax,0x50(%rsp)
02b8  24d32c8:	8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%eax
02bf  24d32cf:	44 89 ac 24 b0 00 00 00 	mov    %r13d,0xb0(%rsp)
02c7  24d32d7:	99                   	cltd
02c8  24d32d8:	f7 fb                	idiv   %ebx
02ca  24d32da:	89 c6                	mov    %eax,%esi
02cc  24d32dc:	8b 44 24 48          	mov    0x48(%rsp),%eax
02d0  24d32e0:	89 54 24 68          	mov    %edx,0x68(%rsp)
02d4  24d32e4:	99                   	cltd
02d5  24d32e5:	41 f7 fd             	idiv   %r13d
02d8  24d32e8:	49 83 fe 04          	cmp    $0x4,%r14
02dc  24d32ec:	89 54 24 40          	mov    %edx,0x40(%rsp)
02e0  24d32f0:	0f 83 46 02 00 00    	jae    24d353c <skl_check_plane_surface+0x52c>
02e6  24d32f6:	49 8d 7c 24 fc       	lea    -0x4(%r12),%rdi
02eb  24d32fb:	48 89 f9             	mov    %rdi,%rcx
02ee  24d32fe:	48 c1 e9 03          	shr    $0x3,%rcx
02f2  24d3302:	0f b6 14 29          	movzbl (%rcx,%rbp,1),%edx
02f6  24d3306:	84 d2                	test   %dl,%dl
02f8  24d3308:	0f 85 08 02 00 00    	jne    24d3516 <skl_check_plane_surface+0x506>
02fe  24d330e:	41 8b 6f fc          	mov    -0x4(%r15),%ebp
0302  24d3312:	4c 89 e1             	mov    %r12,%rcx
0305  24d3315:	01 f5                	add    %esi,%ebp
0307  24d3317:	89 ac 24 bc 00 00 00 	mov    %ebp,0xbc(%rsp)
030e  24d331e:	48 c1 e9 03          	shr    $0x3,%rcx
0312  24d3322:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
031c  24d332c:	0f b6 14 29          	movzbl (%rcx,%rbp,1),%edx
0320  24d3330:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
0325  24d3335:	84 d2                	test   %dl,%dl
0327  24d3337:	0f 85 47 01 00 00    	jne    24d3484 <skl_check_plane_surface+0x474>
032d  24d333d:	41 03 07             	add    (%r15),%eax
0330  24d3340:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
0335  24d3345:	48 8d bc 24 bc 00 00 00 	lea    0xbc(%rsp),%rdi
033d  24d334d:	48 8d b4 24 b8 00 00 00 	lea    0xb8(%rsp),%rsi
0345  24d3355:	44 89 f1             	mov    %r14d,%ecx
0348  24d3358:	89 84 24 b8 00 00 00 	mov    %eax,0xb8(%rsp)
034f  24d335f:	e8 2c 65 00 00       	call   24d9890 <intel_plane_compute_aligned_offset>
0354  24d3364:	49 83 fe 04          	cmp    $0x4,%r14
0358  24d3368:	0f 83 19 02 00 00    	jae    24d3587 <skl_check_plane_surface+0x577>
035e  24d336e:	49 8d 7c 24 f4       	lea    -0xc(%r12),%rdi
0363  24d3373:	48 89 f9             	mov    %rdi,%rcx
0366  24d3376:	48 c1 e9 03          	shr    $0x3,%rcx
036a  24d337a:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx
036e  24d337e:	84 c9                	test   %cl,%cl
0370  24d3380:	0f 85 24 01 00 00    	jne    24d34aa <skl_check_plane_surface+0x49a>
0376  24d3386:	41 89 47 f4          	mov    %eax,-0xc(%r15)
037a  24d338a:	0f af 9c 24 bc 00 00 00 	imul   0xbc(%rsp),%ebx
0382  24d3392:	03 5c 24 68          	add    0x68(%rsp),%ebx
0386  24d3396:	89 d8                	mov    %ebx,%eax
0388  24d3398:	99                   	cltd
0389  24d3399:	f7 7c 24 14          	idivl  0x14(%rsp)
038d  24d339d:	49 83 fe 04          	cmp    $0x4,%r14
0391  24d33a1:	0f 83 02 02 00 00    	jae    24d35a9 <skl_check_plane_surface+0x599>
0397  24d33a7:	49 8d 7c 24 fc       	lea    -0x4(%r12),%rdi
039c  24d33ac:	48 89 f9             	mov    %rdi,%rcx
039f  24d33af:	48 c1 e9 03          	shr    $0x3,%rcx
03a3  24d33b3:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx
03a7  24d33b7:	84 c9                	test   %cl,%cl
03a9  24d33b9:	0f 85 13 01 00 00    	jne    24d34d2 <skl_check_plane_surface+0x4c2>
03af  24d33bf:	41 89 47 fc          	mov    %eax,-0x4(%r15)
03b3  24d33c3:	44 0f af ac 24 b8 00 00 00 	imul   0xb8(%rsp),%r13d
03bc  24d33cc:	44 03 6c 24 40       	add    0x40(%rsp),%r13d
03c1  24d33d1:	44 89 e8             	mov    %r13d,%eax
03c4  24d33d4:	99                   	cltd
03c5  24d33d5:	f7 7c 24 50          	idivl  0x50(%rsp)
03c9  24d33d9:	49 83 fe 04          	cmp    $0x4,%r14
03cd  24d33dd:	0f 83 de 01 00 00    	jae    24d35c1 <skl_check_plane_surface+0x5b1>
03d3  24d33e3:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
03d8  24d33e8:	48 8b 34 24          	mov    (%rsp),%rsi
03dc  24d33ec:	49 bd 04 00 00 00 00 00 00 01 	movabs $0x100000000000004,%r13
03e6  24d33f6:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx
03ea  24d33fa:	84 c9                	test   %cl,%cl
03ec  24d33fc:	0f 85 ee 00 00 00    	jne    24d34f0 <skl_check_plane_surface+0x4e0>
03f2  24d3402:	41 89 07             	mov    %eax,(%r15)
03f5  24d3405:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
03fa  24d340a:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
03ff  24d340f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0403  24d3413:	74 0c                	je     24d3421 <skl_check_plane_surface+0x411>
0405  24d3415:	48 89 df             	mov    %rbx,%rdi
0408  24d3418:	e8 00 00 00 00       	call   24d341d <skl_check_plane_surface+0x40d>	24d3419: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
040d  24d341d:	48 8b 34 24          	mov    (%rsp),%rsi
0411  24d3421:	48 8b 1b             	mov    (%rbx),%rbx
0414  24d3424:	48 83 c3 05          	add    $0x5,%rbx
0418  24d3428:	48 89 d8             	mov    %rbx,%rax
041b  24d342b:	48 c1 e8 03          	shr    $0x3,%rax
041f  24d342f:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0423  24d3433:	84 c0                	test   %al,%al
0425  24d3435:	75 1c                	jne    24d3453 <skl_check_plane_surface+0x443>
0427  24d3437:	0f b6 1b             	movzbl (%rbx),%ebx
042a  24d343a:	49 ff c6             	inc    %r14
042d  24d343d:	49 83 c4 10          	add    $0x10,%r12
0431  24d3441:	49 83 c7 10          	add    $0x10,%r15
0435  24d3445:	49 39 de             	cmp    %rbx,%r14
0438  24d3448:	0f 82 83 fd ff ff    	jb     24d31d1 <skl_check_plane_surface+0x1c1>
043e  24d344e:	e9 9c 01 00 00       	jmp    24d35ef <skl_check_plane_surface+0x5df>
0443  24d3453:	89 d9                	mov    %ebx,%ecx
0445  24d3455:	80 e1 07             	and    $0x7,%cl
0448  24d3458:	38 c1                	cmp    %al,%cl
044a  24d345a:	7c db                	jl     24d3437 <skl_check_plane_surface+0x427>
044c  24d345c:	48 89 df             	mov    %rbx,%rdi
044f  24d345f:	e8 00 00 00 00       	call   24d3464 <skl_check_plane_surface+0x454>	24d3460: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0454  24d3464:	48 8b 34 24          	mov    (%rsp),%rsi
0458  24d3468:	eb cd                	jmp    24d3437 <skl_check_plane_surface+0x427>
045a  24d346a:	89 d9                	mov    %ebx,%ecx
045c  24d346c:	80 e1 07             	and    $0x7,%cl
045f  24d346f:	38 c1                	cmp    %al,%cl
0461  24d3471:	0f 8c e8 fd ff ff    	jl     24d325f <skl_check_plane_surface+0x24f>
0467  24d3477:	48 89 df             	mov    %rbx,%rdi
046a  24d347a:	e8 00 00 00 00       	call   24d347f <skl_check_plane_surface+0x46f>	24d347b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
046f  24d347f:	e9 db fd ff ff       	jmp    24d325f <skl_check_plane_surface+0x24f>
0474  24d3484:	44 89 e1             	mov    %r12d,%ecx
0477  24d3487:	80 e1 07             	and    $0x7,%cl
047a  24d348a:	80 c1 03             	add    $0x3,%cl
047d  24d348d:	38 d1                	cmp    %dl,%cl
047f  24d348f:	0f 8c a8 fe ff ff    	jl     24d333d <skl_check_plane_surface+0x32d>
0485  24d3495:	4c 89 e7             	mov    %r12,%rdi
0488  24d3498:	89 44 24 58          	mov    %eax,0x58(%rsp)
048c  24d349c:	e8 00 00 00 00       	call   24d34a1 <skl_check_plane_surface+0x491>	24d349d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0491  24d34a1:	8b 44 24 58          	mov    0x58(%rsp),%eax
0495  24d34a5:	e9 93 fe ff ff       	jmp    24d333d <skl_check_plane_surface+0x32d>
049a  24d34aa:	89 fa                	mov    %edi,%edx
049c  24d34ac:	80 e2 07             	and    $0x7,%dl
049f  24d34af:	80 c2 03             	add    $0x3,%dl
04a2  24d34b2:	38 ca                	cmp    %cl,%dl
04a4  24d34b4:	0f 8c cc fe ff ff    	jl     24d3386 <skl_check_plane_surface+0x376>
04aa  24d34ba:	89 c5                	mov    %eax,%ebp
04ac  24d34bc:	e8 00 00 00 00       	call   24d34c1 <skl_check_plane_surface+0x4b1>	24d34bd: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
04b1  24d34c1:	89 e8                	mov    %ebp,%eax
04b3  24d34c3:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
04bd  24d34cd:	e9 b4 fe ff ff       	jmp    24d3386 <skl_check_plane_surface+0x376>
04c2  24d34d2:	89 fa                	mov    %edi,%edx
04c4  24d34d4:	80 e2 07             	and    $0x7,%dl
04c7  24d34d7:	80 c2 03             	add    $0x3,%dl
04ca  24d34da:	38 ca                	cmp    %cl,%dl
04cc  24d34dc:	0f 8c dd fe ff ff    	jl     24d33bf <skl_check_plane_surface+0x3af>
04d2  24d34e2:	89 c3                	mov    %eax,%ebx
04d4  24d34e4:	e8 00 00 00 00       	call   24d34e9 <skl_check_plane_surface+0x4d9>	24d34e5: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
04d9  24d34e9:	89 d8                	mov    %ebx,%eax
04db  24d34eb:	e9 cf fe ff ff       	jmp    24d33bf <skl_check_plane_surface+0x3af>
04e0  24d34f0:	44 89 e2             	mov    %r12d,%edx
04e3  24d34f3:	80 e2 07             	and    $0x7,%dl
04e6  24d34f6:	80 c2 03             	add    $0x3,%dl
04e9  24d34f9:	38 ca                	cmp    %cl,%dl
04eb  24d34fb:	0f 8c 01 ff ff ff    	jl     24d3402 <skl_check_plane_surface+0x3f2>
04f1  24d3501:	4c 89 e7             	mov    %r12,%rdi
04f4  24d3504:	89 c3                	mov    %eax,%ebx
04f6  24d3506:	e8 00 00 00 00       	call   24d350b <skl_check_plane_surface+0x4fb>	24d3507: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
04fb  24d350b:	48 8b 34 24          	mov    (%rsp),%rsi
04ff  24d350f:	89 d8                	mov    %ebx,%eax
0501  24d3511:	e9 ec fe ff ff       	jmp    24d3402 <skl_check_plane_surface+0x3f2>
0506  24d3516:	89 f9                	mov    %edi,%ecx
0508  24d3518:	80 e1 07             	and    $0x7,%cl
050b  24d351b:	80 c1 03             	add    $0x3,%cl
050e  24d351e:	38 d1                	cmp    %dl,%cl
0510  24d3520:	0f 8c e8 fd ff ff    	jl     24d330e <skl_check_plane_surface+0x2fe>
0516  24d3526:	89 44 24 58          	mov    %eax,0x58(%rsp)
051a  24d352a:	89 f5                	mov    %esi,%ebp
051c  24d352c:	e8 00 00 00 00       	call   24d3531 <skl_check_plane_surface+0x521>	24d352d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0521  24d3531:	8b 44 24 58          	mov    0x58(%rsp),%eax
0525  24d3535:	89 ee                	mov    %ebp,%esi
0527  24d3537:	e9 d2 fd ff ff       	jmp    24d330e <skl_check_plane_surface+0x2fe>
052c  24d353c:	89 74 24 38          	mov    %esi,0x38(%rsp)
0530  24d3540:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d3543: R_X86_64_32S	.data+0xabb940
0537  24d3547:	4c 89 f6             	mov    %r14,%rsi
053a  24d354a:	89 44 24 58          	mov    %eax,0x58(%rsp)
053e  24d354e:	e8 00 00 00 00       	call   24d3553 <skl_check_plane_surface+0x543>	24d354f: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0543  24d3553:	49 8d 7c 24 fc       	lea    -0x4(%r12),%rdi
0548  24d3558:	48 89 f8             	mov    %rdi,%rax
054b  24d355b:	48 c1 e8 03          	shr    $0x3,%rax
054f  24d355f:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0553  24d3563:	84 c0                	test   %al,%al
0555  24d3565:	75 72                	jne    24d35d9 <skl_check_plane_surface+0x5c9>
0557  24d3567:	41 8b 6f fc          	mov    -0x4(%r15),%ebp
055b  24d356b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d356e: R_X86_64_32S	.data+0xabb960
0562  24d3572:	4c 89 f6             	mov    %r14,%rsi
0565  24d3575:	e8 00 00 00 00       	call   24d357a <skl_check_plane_surface+0x56a>	24d3576: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
056a  24d357a:	8b 44 24 58          	mov    0x58(%rsp),%eax
056e  24d357e:	8b 74 24 38          	mov    0x38(%rsp),%esi
0572  24d3582:	e9 8b fd ff ff       	jmp    24d3312 <skl_check_plane_surface+0x302>
0577  24d3587:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d358a: R_X86_64_32S	.data+0xabc2a0
057e  24d358e:	4c 89 f6             	mov    %r14,%rsi
0581  24d3591:	89 c5                	mov    %eax,%ebp
0583  24d3593:	e8 00 00 00 00       	call   24d3598 <skl_check_plane_surface+0x588>	24d3594: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0588  24d3598:	89 e8                	mov    %ebp,%eax
058a  24d359a:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0594  24d35a4:	e9 c5 fd ff ff       	jmp    24d336e <skl_check_plane_surface+0x35e>
0599  24d35a9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d35ac: R_X86_64_32S	.data+0xabc2c0
05a0  24d35b0:	4c 89 f6             	mov    %r14,%rsi
05a3  24d35b3:	89 c3                	mov    %eax,%ebx
05a5  24d35b5:	e8 00 00 00 00       	call   24d35ba <skl_check_plane_surface+0x5aa>	24d35b6: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
05aa  24d35ba:	89 d8                	mov    %ebx,%eax
05ac  24d35bc:	e9 e6 fd ff ff       	jmp    24d33a7 <skl_check_plane_surface+0x397>
05b1  24d35c1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d35c4: R_X86_64_32S	.data+0xabc2e0
05b8  24d35c8:	4c 89 f6             	mov    %r14,%rsi
05bb  24d35cb:	89 c3                	mov    %eax,%ebx
05bd  24d35cd:	e8 00 00 00 00       	call   24d35d2 <skl_check_plane_surface+0x5c2>	24d35ce: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
05c2  24d35d2:	89 d8                	mov    %ebx,%eax
05c4  24d35d4:	e9 0a fe ff ff       	jmp    24d33e3 <skl_check_plane_surface+0x3d3>
05c9  24d35d9:	89 f9                	mov    %edi,%ecx
05cb  24d35db:	80 e1 07             	and    $0x7,%cl
05ce  24d35de:	80 c1 03             	add    $0x3,%cl
05d1  24d35e1:	38 c1                	cmp    %al,%cl
05d3  24d35e3:	7c 82                	jl     24d3567 <skl_check_plane_surface+0x557>
05d5  24d35e5:	e8 00 00 00 00       	call   24d35ea <skl_check_plane_surface+0x5da>	24d35e6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
05da  24d35ea:	e9 78 ff ff ff       	jmp    24d3567 <skl_check_plane_surface+0x557>
05df  24d35ef:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
05e7  24d35f7:	48 83 c3 48          	add    $0x48,%rbx
05eb  24d35fb:	49 89 df             	mov    %rbx,%r15
05ee  24d35fe:	49 c1 ef 03          	shr    $0x3,%r15
05f2  24d3602:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
05f7  24d3607:	74 08                	je     24d3611 <skl_check_plane_surface+0x601>
05f9  24d3609:	48 89 df             	mov    %rbx,%rdi
05fc  24d360c:	e8 00 00 00 00       	call   24d3611 <skl_check_plane_surface+0x601>	24d360d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0601  24d3611:	48 89 9c 24 98 00 00 00 	mov    %rbx,0x98(%rsp)
0609  24d3619:	48 8b 1b             	mov    (%rbx),%rbx
060c  24d361c:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0611  24d3621:	4c 8d 73 15          	lea    0x15(%rbx),%r14
0615  24d3625:	4c 89 f0             	mov    %r14,%rax
0618  24d3628:	48 c1 e8 03          	shr    $0x3,%rax
061c  24d362c:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0620  24d3630:	84 c0                	test   %al,%al
0622  24d3632:	0f 85 f1 19 00 00    	jne    24d5029 <skl_check_plane_surface+0x2019>
0628  24d3638:	41 80 3e 00          	cmpb   $0x0,(%r14)
062c  24d363c:	0f 84 7d 08 00 00    	je     24d3ebf <skl_check_plane_surface+0xeaf>
0632  24d3642:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0637  24d3647:	4c 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%r14
063f  24d364f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0643  24d3653:	74 08                	je     24d365d <skl_check_plane_surface+0x64d>
0645  24d3655:	4c 89 f7             	mov    %r14,%rdi
0648  24d3658:	e8 00 00 00 00       	call   24d365d <skl_check_plane_surface+0x64d>	24d3659: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
064d  24d365d:	48 83 c3 05          	add    $0x5,%rbx
0651  24d3661:	4d 8b 36             	mov    (%r14),%r14
0654  24d3664:	48 89 d8             	mov    %rbx,%rax
0657  24d3667:	48 c1 e8 03          	shr    $0x3,%rax
065b  24d366b:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
065f  24d366f:	84 c0                	test   %al,%al
0661  24d3671:	0f 85 d7 1a 00 00    	jne    24d514e <skl_check_plane_surface+0x213e>
0667  24d3677:	0f b6 03             	movzbl (%rbx),%eax
066a  24d367a:	49 83 e6 fc          	and    $0xfffffffffffffffc,%r14
066e  24d367e:	31 c9                	xor    %ecx,%ecx
0670  24d3680:	4d 39 ee             	cmp    %r13,%r14
0673  24d3683:	0f 94 c1             	sete   %cl
0676  24d3686:	8d 4c 09 02          	lea    0x2(%rcx,%rcx,1),%ecx
067a  24d368a:	39 c1                	cmp    %eax,%ecx
067c  24d368c:	0f 85 2d 08 00 00    	jne    24d3ebf <skl_check_plane_surface+0xeaf>
0682  24d3692:	4c 89 e0             	mov    %r12,%rax
0685  24d3695:	48 c1 e8 03          	shr    $0x3,%rax
0689  24d3699:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
068d  24d369d:	48 89 04 24          	mov    %rax,(%rsp)
0691  24d36a1:	74 08                	je     24d36ab <skl_check_plane_surface+0x69b>
0693  24d36a3:	4c 89 e7             	mov    %r12,%rdi
0696  24d36a6:	e8 00 00 00 00       	call   24d36ab <skl_check_plane_surface+0x69b>	24d36a7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
069b  24d36ab:	49 8b 1c 24          	mov    (%r12),%rbx
069f  24d36af:	48 89 d8             	mov    %rbx,%rax
06a2  24d36b2:	48 c1 e8 03          	shr    $0x3,%rax
06a6  24d36b6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06aa  24d36ba:	74 08                	je     24d36c4 <skl_check_plane_surface+0x6b4>
06ac  24d36bc:	48 89 df             	mov    %rbx,%rdi
06af  24d36bf:	e8 00 00 00 00       	call   24d36c4 <skl_check_plane_surface+0x6b4>	24d36c0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06b4  24d36c4:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
06bc  24d36cc:	48 8b 03             	mov    (%rbx),%rax
06bf  24d36cf:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
06c3  24d36d3:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
06c8  24d36d8:	74 0d                	je     24d36e7 <skl_check_plane_surface+0x6d7>
06ca  24d36da:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
06d2  24d36e2:	e8 00 00 00 00       	call   24d36e7 <skl_check_plane_surface+0x6d7>	24d36e3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06d7  24d36e7:	4d 8b ac 24 a0 00 00 00 	mov    0xa0(%r12),%r13
06df  24d36ef:	49 8d 5d 48          	lea    0x48(%r13),%rbx
06e3  24d36f3:	48 89 d8             	mov    %rbx,%rax
06e6  24d36f6:	48 c1 e8 03          	shr    $0x3,%rax
06ea  24d36fa:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06ee  24d36fe:	48 89 84 24 c0 00 00 00 	mov    %rax,0xc0(%rsp)
06f6  24d3706:	74 08                	je     24d3710 <skl_check_plane_surface+0x700>
06f8  24d3708:	48 89 df             	mov    %rbx,%rdi
06fb  24d370b:	e8 00 00 00 00       	call   24d3710 <skl_check_plane_surface+0x700>	24d370c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0700  24d3710:	48 89 5c 24 50       	mov    %rbx,0x50(%rsp)
0705  24d3715:	48 8b 1b             	mov    (%rbx),%rbx
0708  24d3718:	48 83 c3 07          	add    $0x7,%rbx
070c  24d371c:	48 89 d8             	mov    %rbx,%rax
070f  24d371f:	48 c1 e8 03          	shr    $0x3,%rax
0713  24d3723:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0717  24d3727:	84 c0                	test   %al,%al
0719  24d3729:	0f 85 72 1b 00 00    	jne    24d52a1 <skl_check_plane_surface+0x2291>
071f  24d372f:	4d 8d 75 78          	lea    0x78(%r13),%r14
0723  24d3733:	0f b6 1b             	movzbl (%rbx),%ebx
0726  24d3736:	4c 89 f0             	mov    %r14,%rax
0729  24d3739:	48 c1 e8 03          	shr    $0x3,%rax
072d  24d373d:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0731  24d3741:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
0739  24d3749:	74 08                	je     24d3753 <skl_check_plane_surface+0x743>
073b  24d374b:	4c 89 f7             	mov    %r14,%rdi
073e  24d374e:	e8 00 00 00 00       	call   24d3753 <skl_check_plane_surface+0x743>	24d374f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0743  24d3753:	49 8b 16             	mov    (%r14),%rdx
0746  24d3756:	48 b8 01 00 00 00 00 00 00 01 	movabs $0x100000000000001,%rax
0750  24d3760:	4c 89 74 24 78       	mov    %r14,0x78(%rsp)
0755  24d3765:	48 39 c2             	cmp    %rax,%rdx
0758  24d3768:	7e 30                	jle    24d379a <skl_check_plane_surface+0x78a>
075a  24d376a:	48 b8 fe ff ff ff ff ff ff fe 	movabs $0xfefffffffffffffe,%rax
0764  24d3774:	48 01 d0             	add    %rdx,%rax
0767  24d3777:	48 83 f8 04          	cmp    $0x4,%rax
076b  24d377b:	73 3b                	jae    24d37b8 <skl_check_plane_surface+0x7a8>
076d  24d377d:	31 c0                	xor    %eax,%eax
076f  24d377f:	80 fb 08             	cmp    $0x8,%bl
0772  24d3782:	0f 95 c0             	setne  %al
0775  24d3785:	c1 e0 0b             	shl    $0xb,%eax
0778  24d3788:	05 00 08 00 00       	add    $0x800,%eax
077d  24d378d:	89 44 24 40          	mov    %eax,0x40(%rsp)
0781  24d3791:	eb 51                	jmp    24d37e4 <skl_check_plane_surface+0x7d4>
0783  24d3793:	31 c0                	xor    %eax,%eax
0785  24d3795:	e9 1d 22 00 00       	jmp    24d59b7 <skl_check_plane_surface+0x29a7>
078a  24d379a:	48 85 d2             	test   %rdx,%rdx
078d  24d379d:	74 05                	je     24d37a4 <skl_check_plane_surface+0x794>
078f  24d379f:	48 39 c2             	cmp    %rax,%rdx
0792  24d37a2:	75 23                	jne    24d37c7 <skl_check_plane_surface+0x7b7>
0794  24d37a4:	31 c0                	xor    %eax,%eax
0796  24d37a6:	80 fb 08             	cmp    $0x8,%bl
0799  24d37a9:	0f 95 c0             	setne  %al
079c  24d37ac:	83 c8 04             	or     $0x4,%eax
079f  24d37af:	c1 e0 0a             	shl    $0xa,%eax
07a2  24d37b2:	89 44 24 40          	mov    %eax,0x40(%rsp)
07a6  24d37b6:	eb 2c                	jmp    24d37e4 <skl_check_plane_surface+0x7d4>
07a8  24d37b8:	48 b8 07 00 00 00 00 00 00 01 	movabs $0x100000000000007,%rax
07b2  24d37c2:	48 39 c2             	cmp    %rax,%rdx
07b5  24d37c5:	74 b6                	je     24d377d <skl_check_plane_surface+0x76d>
07b7  24d37c7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d37ca: R_X86_64_32S	.rodata+0x9de560
07be  24d37ce:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	24d37d1: R_X86_64_32S	.rodata+0x9e28a0
07c5  24d37d5:	e8 00 00 00 00       	call   24d37da <skl_check_plane_surface+0x7ca>	24d37d6: R_X86_64_PLT32	__warn_printk-0x4
07ca  24d37da:	0f 0b                	ud2
07cc  24d37dc:	c7 44 24 40 00 08 00 00 	movl   $0x800,0x40(%rsp)
07d4  24d37e4:	49 8d 7c 24 60       	lea    0x60(%r12),%rdi
07d9  24d37e9:	48 89 f8             	mov    %rdi,%rax
07dc  24d37ec:	48 c1 e8 03          	shr    $0x3,%rax
07e0  24d37f0:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
07e4  24d37f4:	84 c0                	test   %al,%al
07e6  24d37f6:	0f 85 bf 1a 00 00    	jne    24d52bb <skl_check_plane_surface+0x22ab>
07ec  24d37fc:	49 8d 7c 24 64       	lea    0x64(%r12),%rdi
07f1  24d3801:	45 8b 74 24 60       	mov    0x60(%r12),%r14d
07f6  24d3806:	48 89 f8             	mov    %rdi,%rax
07f9  24d3809:	48 c1 e8 03          	shr    $0x3,%rax
07fd  24d380d:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0801  24d3811:	84 c0                	test   %al,%al
0803  24d3813:	0f 85 bc 1a 00 00    	jne    24d52d5 <skl_check_plane_surface+0x22c5>
0809  24d3819:	41 8b 44 24 64       	mov    0x64(%r12),%eax
080e  24d381e:	49 8d 7c 24 68       	lea    0x68(%r12),%rdi
0813  24d3823:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
0818  24d3828:	89 44 24 20          	mov    %eax,0x20(%rsp)
081c  24d382c:	48 89 f8             	mov    %rdi,%rax
081f  24d382f:	48 c1 e8 03          	shr    $0x3,%rax
0823  24d3833:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0827  24d3837:	84 c0                	test   %al,%al
0829  24d3839:	0f 85 b0 1a 00 00    	jne    24d52ef <skl_check_plane_surface+0x22df>
082f  24d383f:	49 8d 7c 24 6c       	lea    0x6c(%r12),%rdi
0834  24d3844:	45 8b 7c 24 68       	mov    0x68(%r12),%r15d
0839  24d3849:	48 89 f8             	mov    %rdi,%rax
083c  24d384c:	48 c1 e8 03          	shr    $0x3,%rax
0840  24d3850:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0844  24d3854:	84 c0                	test   %al,%al
0846  24d3856:	0f 85 ad 1a 00 00    	jne    24d5309 <skl_check_plane_surface+0x22f9>
084c  24d385c:	49 8d 8c 24 08 01 00 00 	lea    0x108(%r12),%rcx
0854  24d3864:	44 89 f3             	mov    %r14d,%ebx
0857  24d3867:	44 89 74 24 14       	mov    %r14d,0x14(%rsp)
085c  24d386c:	45 8b 74 24 6c       	mov    0x6c(%r12),%r14d
0861  24d3871:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
0866  24d3876:	48 89 c8             	mov    %rcx,%rax
0869  24d3879:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
086e  24d387e:	48 c1 e9 03          	shr    $0x3,%rcx
0872  24d3882:	c1 fb 11             	sar    $0x11,%ebx
0875  24d3885:	0f b6 04 29          	movzbl (%rcx,%rbp,1),%eax
0879  24d3889:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
087e  24d388e:	84 c0                	test   %al,%al
0880  24d3890:	0f 85 8d 1a 00 00    	jne    24d5323 <skl_check_plane_surface+0x2313>
0886  24d3896:	41 03 9c 24 08 01 00 00 	add    0x108(%r12),%ebx
088e  24d389e:	44 8b 6c 24 20       	mov    0x20(%rsp),%r13d
0893  24d38a3:	89 5c 24 0c          	mov    %ebx,0xc(%rsp)
0897  24d38a7:	49 8d 9c 24 0c 01 00 00 	lea    0x10c(%r12),%rbx
089f  24d38af:	41 c1 fd 11          	sar    $0x11,%r13d
08a3  24d38b3:	48 89 d8             	mov    %rbx,%rax
08a6  24d38b6:	48 c1 e8 03          	shr    $0x3,%rax
08aa  24d38ba:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
08af  24d38bf:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
08b3  24d38c3:	84 c0                	test   %al,%al
08b5  24d38c5:	0f 85 7a 1a 00 00    	jne    24d5345 <skl_check_plane_surface+0x2335>
08bb  24d38cb:	45 03 ac 24 0c 01 00 00 	add    0x10c(%r12),%r13d
08c3  24d38d3:	48 8b 04 24          	mov    (%rsp),%rax
08c7  24d38d7:	48 89 9c 24 90 00 00 00 	mov    %rbx,0x90(%rsp)
08cf  24d38df:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
08d4  24d38e4:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
08d8  24d38e8:	74 08                	je     24d38f2 <skl_check_plane_surface+0x8e2>
08da  24d38ea:	4c 89 e7             	mov    %r12,%rdi
08dd  24d38ed:	e8 00 00 00 00       	call   24d38f2 <skl_check_plane_surface+0x8e2>	24d38ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08e2  24d38f2:	49 8b 1c 24          	mov    (%r12),%rbx
08e6  24d38f6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
08f0  24d3900:	48 89 d8             	mov    %rbx,%rax
08f3  24d3903:	48 c1 e8 03          	shr    $0x3,%rax
08f7  24d3907:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
08fb  24d390b:	74 08                	je     24d3915 <skl_check_plane_surface+0x905>
08fd  24d390d:	48 89 df             	mov    %rbx,%rdi
0900  24d3910:	e8 00 00 00 00       	call   24d3915 <skl_check_plane_surface+0x905>	24d3911: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0905  24d3915:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
090a  24d391a:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
0912  24d3922:	48 8b 2b             	mov    (%rbx),%rbp
0915  24d3925:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
091d  24d392d:	48 05 ac 00 00 00    	add    $0xac,%rax
0923  24d3933:	48 89 04 24          	mov    %rax,(%rsp)
0927  24d3937:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0931  24d3941:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0935  24d3945:	74 08                	je     24d394f <skl_check_plane_surface+0x93f>
0937  24d3947:	4c 89 e7             	mov    %r12,%rdi
093a  24d394a:	e8 00 00 00 00       	call   24d394f <skl_check_plane_surface+0x93f>	24d394b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
093f  24d394f:	48 8b 04 24          	mov    (%rsp),%rax
0943  24d3953:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
094d  24d395d:	4d 8b 04 24          	mov    (%r12),%r8
0951  24d3961:	48 c1 e8 03          	shr    $0x3,%rax
0955  24d3965:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
095a  24d396a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
095f  24d396f:	84 c0                	test   %al,%al
0961  24d3971:	0f 85 eb 19 00 00    	jne    24d5362 <skl_check_plane_surface+0x2352>
0967  24d3977:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
096c  24d397c:	4c 8d a0 04 01 00 00 	lea    0x104(%rax),%r12
0973  24d3983:	44 8b 90 ac 00 00 00 	mov    0xac(%rax),%r10d
097a  24d398a:	4c 89 e0             	mov    %r12,%rax
097d  24d398d:	48 c1 e8 03          	shr    $0x3,%rax
0981  24d3991:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0986  24d3996:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
098b  24d399b:	84 c0                	test   %al,%al
098d  24d399d:	0f 85 e5 19 00 00    	jne    24d5388 <skl_check_plane_surface+0x2378>
0993  24d39a3:	48 81 c3 94 05 00 00 	add    $0x594,%rbx
099a  24d39aa:	44 2b 7c 24 14       	sub    0x14(%rsp),%r15d
099f  24d39af:	45 8b 0c 24          	mov    (%r12),%r9d
09a3  24d39b3:	48 89 d8             	mov    %rbx,%rax
09a6  24d39b6:	48 c1 e8 03          	shr    $0x3,%rax
09aa  24d39ba:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
09af  24d39bf:	84 c0                	test   %al,%al
09b1  24d39c1:	0f 85 ff 19 00 00    	jne    24d53c6 <skl_check_plane_surface+0x23b6>
09b7  24d39c7:	44 2b 74 24 20       	sub    0x20(%rsp),%r14d
09bc  24d39cc:	41 c1 ff 11          	sar    $0x11,%r15d
09c0  24d39d0:	83 3b 07             	cmpl   $0x7,(%rbx)
09c3  24d39d3:	49 89 ed             	mov    %rbp,%r13
09c6  24d39d6:	75 55                	jne    24d3a2d <skl_check_plane_surface+0xa1d>
09c8  24d39d8:	49 8d 9d a4 10 00 00 	lea    0x10a4(%r13),%rbx
09cf  24d39df:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
09d9  24d39e9:	48 89 d8             	mov    %rbx,%rax
09dc  24d39ec:	48 c1 e8 03          	shr    $0x3,%rax
09e0  24d39f0:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
09e4  24d39f4:	84 c0                	test   %al,%al
09e6  24d39f6:	0f 85 8c 1c 00 00    	jne    24d5688 <skl_check_plane_surface+0x2678>
09ec  24d39fc:	8b 0b                	mov    (%rbx),%ecx
09ee  24d39fe:	b8 00 40 00 00       	mov    $0x4000,%eax
09f3  24d3a03:	f6 c1 10             	test   $0x10,%cl
09f6  24d3a06:	75 60                	jne    24d3a68 <skl_check_plane_surface+0xa58>
09f8  24d3a08:	b8 00 01 00 00       	mov    $0x100,%eax
09fd  24d3a0d:	f6 c1 40             	test   $0x40,%cl
0a00  24d3a10:	75 56                	jne    24d3a68 <skl_check_plane_surface+0xa58>
0a02  24d3a12:	b8 20 00 00 00       	mov    $0x20,%eax
0a07  24d3a17:	f6 c1 20             	test   $0x20,%cl
0a0a  24d3a1a:	75 4c                	jne    24d3a68 <skl_check_plane_surface+0xa58>
0a0c  24d3a1c:	84 c9                	test   %cl,%cl
0a0e  24d3a1e:	b9 00 10 00 00       	mov    $0x1000,%ecx
0a13  24d3a23:	b8 20 00 00 00       	mov    $0x20,%eax
0a18  24d3a28:	0f 49 c1             	cmovns %ecx,%eax
0a1b  24d3a2b:	eb 3b                	jmp    24d3a68 <skl_check_plane_surface+0xa58>
0a1d  24d3a2d:	4c 89 c7             	mov    %r8,%rdi
0a20  24d3a30:	be 01 00 00 00       	mov    $0x1,%esi
0a25  24d3a35:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
0a2a  24d3a3a:	45 89 f5             	mov    %r14d,%r13d
0a2d  24d3a3d:	4d 89 e6             	mov    %r12,%r14
0a30  24d3a40:	45 89 fc             	mov    %r15d,%r12d
0a33  24d3a43:	4c 89 c3             	mov    %r8,%rbx
0a36  24d3a46:	4c 89 d5             	mov    %r10,%rbp
0a39  24d3a49:	45 89 cf             	mov    %r9d,%r15d
0a3c  24d3a4c:	e8 7f e5 ff ff       	call   24d1fd0 <intel_surf_alignment>
0a41  24d3a51:	45 89 f9             	mov    %r15d,%r9d
0a44  24d3a54:	45 89 e7             	mov    %r12d,%r15d
0a47  24d3a57:	4d 89 f4             	mov    %r14,%r12
0a4a  24d3a5a:	45 89 ee             	mov    %r13d,%r14d
0a4d  24d3a5d:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
0a52  24d3a62:	49 89 ea             	mov    %rbp,%r10
0a55  24d3a65:	49 89 d8             	mov    %rbx,%r8
0a58  24d3a68:	41 c1 fe 11          	sar    $0x11,%r14d
0a5c  24d3a6c:	4c 89 c1             	mov    %r8,%rcx
0a5f  24d3a6f:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
0a64  24d3a74:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
0a69  24d3a79:	4c 89 ef             	mov    %r13,%rdi
0a6c  24d3a7c:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0a72  24d3a82:	50                   	push   %rax
0a73  24d3a83:	41 52                	push   %r10
0a75  24d3a85:	e8 66 b3 04 00       	call   251edf0 <intel_compute_aligned_offset>
0a7a  24d3a8a:	48 83 c4 10          	add    $0x10,%rsp
0a7e  24d3a8e:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
0a82  24d3a92:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
0a87  24d3a97:	41 39 ef             	cmp    %ebp,%r15d
0a8a  24d3a9a:	0f 8f 9b 01 00 00    	jg     24d3c3b <skl_check_plane_surface+0xc2b>
0a90  24d3aa0:	41 81 fe 01 10 00 00 	cmp    $0x1001,%r14d
0a97  24d3aa7:	0f 8d 8e 01 00 00    	jge    24d3c3b <skl_check_plane_surface+0xc2b>
0a9d  24d3aad:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
0aa5  24d3ab5:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0aaf  24d3abf:	4c 8b 74 24 78       	mov    0x78(%rsp),%r14
0ab4  24d3ac4:	41 89 c5             	mov    %eax,%r13d
0ab7  24d3ac7:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
0abc  24d3acc:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0ac0  24d3ad0:	74 08                	je     24d3ada <skl_check_plane_surface+0xaca>
0ac2  24d3ad2:	4c 89 f7             	mov    %r14,%rdi
0ac5  24d3ad5:	e8 00 00 00 00       	call   24d3ada <skl_check_plane_surface+0xaca>	24d3ad6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aca  24d3ada:	49 8b 06             	mov    (%r14),%rax
0acd  24d3add:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0ad2  24d3ae2:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
0ad7  24d3ae7:	48 b9 04 00 00 00 00 00 00 01 	movabs $0x100000000000004,%rcx
0ae1  24d3af1:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
0ae5  24d3af5:	48 39 c8             	cmp    %rcx,%rax
0ae8  24d3af8:	0f 85 5e 03 00 00    	jne    24d3e5c <skl_check_plane_surface+0xe4c>
0aee  24d3afe:	4c 8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%r14
0af6  24d3b06:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
0afb  24d3b0b:	74 08                	je     24d3b15 <skl_check_plane_surface+0xb05>
0afd  24d3b0d:	48 89 df             	mov    %rbx,%rdi
0b00  24d3b10:	e8 00 00 00 00       	call   24d3b15 <skl_check_plane_surface+0xb05>	24d3b11: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b05  24d3b15:	48 8b 1b             	mov    (%rbx),%rbx
0b08  24d3b18:	48 83 c3 05          	add    $0x5,%rbx
0b0c  24d3b1c:	48 89 d8             	mov    %rbx,%rax
0b0f  24d3b1f:	48 c1 e8 03          	shr    $0x3,%rax
0b13  24d3b23:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0b17  24d3b27:	84 c0                	test   %al,%al
0b19  24d3b29:	0f 85 49 1c 00 00    	jne    24d5778 <skl_check_plane_surface+0x2768>
0b1f  24d3b2f:	80 3b 03             	cmpb   $0x3,(%rbx)
0b22  24d3b32:	0f 86 bd 13 00 00    	jbe    24d4ef5 <skl_check_plane_surface+0x1ee5>
0b28  24d3b38:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
0b2d  24d3b3d:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
0b32  24d3b42:	74 08                	je     24d3b4c <skl_check_plane_surface+0xb3c>
0b34  24d3b44:	48 89 df             	mov    %rbx,%rdi
0b37  24d3b47:	e8 00 00 00 00       	call   24d3b4c <skl_check_plane_surface+0xb3c>	24d3b48: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b3c  24d3b4c:	48 8b 1b             	mov    (%rbx),%rbx
0b3f  24d3b4f:	48 83 c3 05          	add    $0x5,%rbx
0b43  24d3b53:	48 89 d8             	mov    %rbx,%rax
0b46  24d3b56:	48 c1 e8 03          	shr    $0x3,%rax
0b4a  24d3b5a:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0b4e  24d3b5e:	84 c0                	test   %al,%al
0b50  24d3b60:	0f 85 2c 1c 00 00    	jne    24d5792 <skl_check_plane_surface+0x2782>
0b56  24d3b66:	0f b6 03             	movzbl (%rbx),%eax
0b59  24d3b69:	89 c6                	mov    %eax,%esi
0b5b  24d3b6b:	89 44 24 14          	mov    %eax,0x14(%rsp)
0b5f  24d3b6f:	d1 ee                	shr    %esi
0b61  24d3b71:	48 ff c6             	inc    %rsi
0b64  24d3b74:	83 f8 06             	cmp    $0x6,%eax
0b67  24d3b77:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
0b6c  24d3b7c:	0f 83 70 1d 00 00    	jae    24d58f2 <skl_check_plane_surface+0x28e2>
0b72  24d3b82:	89 f0                	mov    %esi,%eax
0b74  24d3b84:	c1 e0 04             	shl    $0x4,%eax
0b77  24d3b87:	49 8d 9c 04 f0 00 00 00 	lea    0xf0(%r12,%rax,1),%rbx
0b7f  24d3b8f:	48 89 d8             	mov    %rbx,%rax
0b82  24d3b92:	48 c1 e8 03          	shr    $0x3,%rax
0b86  24d3b96:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0b8a  24d3b9a:	84 c0                	test   %al,%al
0b8c  24d3b9c:	0f 85 0a 1c 00 00    	jne    24d57ac <skl_check_plane_surface+0x279c>
0b92  24d3ba2:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
0b97  24d3ba7:	44 8b 3b             	mov    (%rbx),%r15d
0b9a  24d3baa:	be 01 00 00 00       	mov    $0x1,%esi
0b9f  24d3baf:	e8 1c e4 ff ff       	call   24d1fd0 <intel_surf_alignment>
0ba4  24d3bb4:	4c 8b b4 24 80 00 00 00 	mov    0x80(%rsp),%r14
0bac  24d3bbc:	4c 8b 64 24 40       	mov    0x40(%rsp),%r12
0bb1  24d3bc1:	45 39 fd             	cmp    %r15d,%r13d
0bb4  24d3bc4:	89 44 24 50          	mov    %eax,0x50(%rsp)
0bb8  24d3bc8:	0f 86 c0 00 00 00    	jbe    24d3c8e <skl_check_plane_surface+0xc7e>
0bbe  24d3bce:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
0bc6  24d3bd6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0bca  24d3bda:	74 08                	je     24d3be4 <skl_check_plane_surface+0xbd4>
0bcc  24d3bdc:	4c 89 f7             	mov    %r14,%rdi
0bcf  24d3bdf:	e8 00 00 00 00       	call   24d3be4 <skl_check_plane_surface+0xbd4>	24d3be0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bd4  24d3be4:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
0bd9  24d3be9:	8b 5c 24 50          	mov    0x50(%rsp),%ebx
0bdd  24d3bed:	49 8b 16             	mov    (%r14),%rdx
0be0  24d3bf0:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0be4  24d3bf4:	f7 db                	neg    %ebx
0be6  24d3bf6:	84 c0                	test   %al,%al
0be8  24d3bf8:	0f 85 14 1c 00 00    	jne    24d5812 <skl_check_plane_surface+0x2802>
0bee  24d3bfe:	48 8b 04 24          	mov    (%rsp),%rax
0bf2  24d3c02:	41 21 df             	and    %ebx,%r15d
0bf5  24d3c05:	44 8b 00             	mov    (%rax),%r8d
0bf8  24d3c08:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
0bfd  24d3c0d:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0c01  24d3c11:	84 c0                	test   %al,%al
0c03  24d3c13:	0f 85 1f 1c 00 00    	jne    24d5838 <skl_check_plane_surface+0x2828>
0c09  24d3c19:	45 8b 0c 24          	mov    (%r12),%r9d
0c0d  24d3c1d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
0c12  24d3c22:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
0c17  24d3c27:	b9 01 00 00 00       	mov    $0x1,%ecx
0c1c  24d3c2c:	41 57                	push   %r15
0c1e  24d3c2e:	41 55                	push   %r13
0c20  24d3c30:	e8 fb a8 04 00       	call   251e530 <intel_adjust_aligned_offset>
0c25  24d3c35:	48 83 c4 10          	add    $0x10,%rsp
0c29  24d3c39:	eb 56                	jmp    24d3c91 <skl_check_plane_surface+0xc81>
0c2b  24d3c3b:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0c30  24d3c40:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c3a  24d3c4a:	48 83 c3 18          	add    $0x18,%rbx
0c3e  24d3c4e:	48 89 d8             	mov    %rbx,%rax
0c41  24d3c51:	48 c1 e8 03          	shr    $0x3,%rax
0c45  24d3c55:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0c49  24d3c59:	74 08                	je     24d3c63 <skl_check_plane_surface+0xc53>
0c4b  24d3c5b:	48 89 df             	mov    %rbx,%rdi
0c4e  24d3c5e:	e8 00 00 00 00       	call   24d3c63 <skl_check_plane_surface+0xc53>	24d3c5f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c53  24d3c63:	48 8b 3b             	mov    (%rbx),%rdi
0c56  24d3c66:	be 04 00 00 00       	mov    $0x4,%esi
0c5b  24d3c6b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	24d3c6e: R_X86_64_32S	.rodata+0x9e2e60
0c62  24d3c72:	44 89 f9             	mov    %r15d,%ecx
0c65  24d3c75:	45 89 f0             	mov    %r14d,%r8d
0c68  24d3c78:	41 89 e9             	mov    %ebp,%r9d
0c6b  24d3c7b:	68 00 10 00 00       	push   $0x1000
0c70  24d3c80:	e8 00 00 00 00       	call   24d3c85 <skl_check_plane_surface+0xc75>	24d3c81: R_X86_64_PLT32	drm_dev_dbg-0x4
0c75  24d3c85:	48 83 c4 08          	add    $0x8,%rsp
0c79  24d3c89:	e9 24 1d 00 00       	jmp    24d59b2 <skl_check_plane_surface+0x29a2>
0c7e  24d3c8e:	45 89 ef             	mov    %r13d,%r15d
0c81  24d3c91:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
0c86  24d3c96:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
0c8a  24d3c9a:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0c8f  24d3c9f:	44 89 f9             	mov    %r15d,%ecx
0c92  24d3ca2:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
0c97  24d3ca7:	44 89 e6             	mov    %r12d,%esi
0c9a  24d3caa:	89 da                	mov    %ebx,%edx
0c9c  24d3cac:	e8 0f be 04 00       	call   251fac0 <skl_check_main_ccs_coordinates>
0ca1  24d3cb1:	45 85 ff             	test   %r15d,%r15d
0ca4  24d3cb4:	0f 84 26 01 00 00    	je     24d3de0 <skl_check_plane_surface+0xdd0>
0caa  24d3cba:	84 c0                	test   %al,%al
0cac  24d3cbc:	0f 85 1e 01 00 00    	jne    24d3de0 <skl_check_plane_surface+0xdd0>
0cb2  24d3cc2:	8b 44 24 50          	mov    0x50(%rsp),%eax
0cb6  24d3cc6:	89 c5                	mov    %eax,%ebp
0cb8  24d3cc8:	f7 dd                	neg    %ebp
0cba  24d3cca:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
0cc2  24d3cd2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0ccc  24d3cdc:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
0cd4  24d3ce4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0cd8  24d3ce8:	74 08                	je     24d3cf2 <skl_check_plane_surface+0xce2>
0cda  24d3cea:	48 89 df             	mov    %rbx,%rdi
0cdd  24d3ced:	e8 00 00 00 00       	call   24d3cf2 <skl_check_plane_surface+0xce2>	24d3cee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ce2  24d3cf2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
0ce7  24d3cf7:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0cf1  24d3d01:	48 8b 13             	mov    (%rbx),%rdx
0cf4  24d3d04:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0cf9  24d3d09:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0cfe  24d3d0e:	84 c0                	test   %al,%al
0d00  24d3d10:	75 7a                	jne    24d3d8c <skl_check_plane_surface+0xd7c>
0d02  24d3d12:	48 8b 04 24          	mov    (%rsp),%rax
0d06  24d3d16:	44 8b 00             	mov    (%rax),%r8d
0d09  24d3d19:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
0d0e  24d3d1e:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0d13  24d3d23:	84 c0                	test   %al,%al
0d15  24d3d25:	0f 85 87 00 00 00    	jne    24d3db2 <skl_check_plane_surface+0xda2>
0d1b  24d3d2b:	45 89 fd             	mov    %r15d,%r13d
0d1e  24d3d2e:	45 8b 8c 24 04 01 00 00 	mov    0x104(%r12),%r9d
0d26  24d3d36:	46 8d 74 3d 00       	lea    0x0(%rbp,%r15,1),%r14d
0d2b  24d3d3b:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
0d30  24d3d40:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
0d35  24d3d45:	b9 01 00 00 00       	mov    $0x1,%ecx
0d3a  24d3d4a:	44 2b 6c 24 50       	sub    0x50(%rsp),%r13d
0d3f  24d3d4f:	41 56                	push   %r14
0d41  24d3d51:	41 57                	push   %r15
0d43  24d3d53:	e8 d8 a7 04 00       	call   251e530 <intel_adjust_aligned_offset>
0d48  24d3d58:	48 83 c4 10          	add    $0x10,%rsp
0d4c  24d3d5c:	4c 89 e7             	mov    %r12,%rdi
0d4f  24d3d5f:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
0d54  24d3d64:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
0d58  24d3d68:	44 89 f1             	mov    %r14d,%ecx
0d5b  24d3d6b:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
0d60  24d3d70:	44 89 e6             	mov    %r12d,%esi
0d63  24d3d73:	89 da                	mov    %ebx,%edx
0d65  24d3d75:	e8 46 bd 04 00       	call   251fac0 <skl_check_main_ccs_coordinates>
0d6a  24d3d7a:	45 85 f6             	test   %r14d,%r14d
0d6d  24d3d7d:	74 64                	je     24d3de3 <skl_check_plane_surface+0xdd3>
0d6f  24d3d7f:	84 c0                	test   %al,%al
0d71  24d3d81:	45 89 ef             	mov    %r13d,%r15d
0d74  24d3d84:	0f 84 40 ff ff ff    	je     24d3cca <skl_check_plane_surface+0xcba>
0d7a  24d3d8a:	eb 57                	jmp    24d3de3 <skl_check_plane_surface+0xdd3>
0d7c  24d3d8c:	48 8b 0c 24          	mov    (%rsp),%rcx
0d80  24d3d90:	80 e1 07             	and    $0x7,%cl
0d83  24d3d93:	80 c1 03             	add    $0x3,%cl
0d86  24d3d96:	38 c1                	cmp    %al,%cl
0d88  24d3d98:	0f 8c 74 ff ff ff    	jl     24d3d12 <skl_check_plane_surface+0xd02>
0d8e  24d3d9e:	48 8b 3c 24          	mov    (%rsp),%rdi
0d92  24d3da2:	48 89 d3             	mov    %rdx,%rbx
0d95  24d3da5:	e8 00 00 00 00       	call   24d3daa <skl_check_plane_surface+0xd9a>	24d3da6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d9a  24d3daa:	48 89 da             	mov    %rbx,%rdx
0d9d  24d3dad:	e9 60 ff ff ff       	jmp    24d3d12 <skl_check_plane_surface+0xd02>
0da2  24d3db2:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
0da7  24d3db7:	80 e1 07             	and    $0x7,%cl
0daa  24d3dba:	80 c1 03             	add    $0x3,%cl
0dad  24d3dbd:	38 c1                	cmp    %al,%cl
0daf  24d3dbf:	0f 8c 66 ff ff ff    	jl     24d3d2b <skl_check_plane_surface+0xd1b>
0db5  24d3dc5:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
0dba  24d3dca:	48 89 d3             	mov    %rdx,%rbx
0dbd  24d3dcd:	45 89 c6             	mov    %r8d,%r14d
0dc0  24d3dd0:	e8 00 00 00 00       	call   24d3dd5 <skl_check_plane_surface+0xdc5>	24d3dd1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0dc5  24d3dd5:	45 89 f0             	mov    %r14d,%r8d
0dc8  24d3dd8:	48 89 da             	mov    %rbx,%rdx
0dcb  24d3ddb:	e9 4b ff ff ff       	jmp    24d3d2b <skl_check_plane_surface+0xd1b>
0dd0  24d3de0:	45 89 fd             	mov    %r15d,%r13d
0dd3  24d3de3:	80 7c 24 14 05       	cmpb   $0x5,0x14(%rsp)
0dd8  24d3de8:	0f 87 1a 1b 00 00    	ja     24d5908 <skl_check_plane_surface+0x28f8>
0dde  24d3dee:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
0de3  24d3df3:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
0de8  24d3df8:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0df2  24d3e02:	89 d0                	mov    %edx,%eax
0df4  24d3e04:	c1 e0 04             	shl    $0x4,%eax
0df7  24d3e07:	4c 8d bc 01 f8 00 00 00 	lea    0xf8(%rcx,%rax,1),%r15
0dff  24d3e0f:	4c 89 f8             	mov    %r15,%rax
0e02  24d3e12:	48 c1 e8 03          	shr    $0x3,%rax
0e06  24d3e16:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0e0a  24d3e1a:	84 c0                	test   %al,%al
0e0c  24d3e1c:	0f 85 a7 19 00 00    	jne    24d57c9 <skl_check_plane_surface+0x27b9>
0e12  24d3e22:	45 3b 27             	cmp    (%r15),%r12d
0e15  24d3e25:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0e1a  24d3e2a:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
0e1f  24d3e2f:	0f 85 4b 1b 00 00    	jne    24d5980 <skl_check_plane_surface+0x2970>
0e25  24d3e35:	c1 e2 04             	shl    $0x4,%edx
0e28  24d3e38:	4d 8d b4 14 fc 00 00 00 	lea    0xfc(%r12,%rdx,1),%r14
0e30  24d3e40:	4c 89 f0             	mov    %r14,%rax
0e33  24d3e43:	48 c1 e8 03          	shr    $0x3,%rax
0e37  24d3e47:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0e3b  24d3e4b:	84 c0                	test   %al,%al
0e3d  24d3e4d:	0f 85 0f 1a 00 00    	jne    24d5862 <skl_check_plane_surface+0x2852>
0e43  24d3e53:	41 3b 1e             	cmp    (%r14),%ebx
0e46  24d3e56:	0f 85 24 1b 00 00    	jne    24d5980 <skl_check_plane_surface+0x2970>
0e4c  24d3e5c:	49 8d 9c 24 00 01 00 00 	lea    0x100(%r12),%rbx
0e54  24d3e64:	48 89 d8             	mov    %rbx,%rax
0e57  24d3e67:	48 c1 e8 03          	shr    $0x3,%rax
0e5b  24d3e6b:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0e5f  24d3e6f:	84 c0                	test   %al,%al
0e61  24d3e71:	0f 85 72 18 00 00    	jne    24d56e9 <skl_check_plane_surface+0x26d9>
0e67  24d3e77:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0e6c  24d3e7c:	44 89 2b             	mov    %r13d,(%rbx)
0e6f  24d3e7f:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
0e73  24d3e83:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0e77  24d3e87:	84 c0                	test   %al,%al
0e79  24d3e89:	0f 85 77 18 00 00    	jne    24d5706 <skl_check_plane_surface+0x26f6>
0e7f  24d3e8f:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
0e84  24d3e94:	49 bd 04 00 00 00 00 00 00 01 	movabs $0x100000000000004,%r13
0e8e  24d3e9e:	89 18                	mov    %ebx,(%rax)
0e90  24d3ea0:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
0e95  24d3ea5:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
0e99  24d3ea9:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0e9d  24d3ead:	84 c0                	test   %al,%al
0e9f  24d3eaf:	0f 85 73 18 00 00    	jne    24d5728 <skl_check_plane_surface+0x2718>
0ea5  24d3eb5:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
0ead  24d3ebd:	89 18                	mov    %ebx,(%rax)
0eaf  24d3ebf:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
0eb4  24d3ec4:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
0ebc  24d3ecc:	74 08                	je     24d3ed6 <skl_check_plane_surface+0xec6>
0ebe  24d3ece:	48 89 df             	mov    %rbx,%rdi
0ec1  24d3ed1:	e8 00 00 00 00       	call   24d3ed6 <skl_check_plane_surface+0xec6>	24d3ed2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ec6  24d3ed6:	48 8b 1b             	mov    (%rbx),%rbx
0ec9  24d3ed9:	48 83 c3 05          	add    $0x5,%rbx
0ecd  24d3edd:	48 89 d8             	mov    %rbx,%rax
0ed0  24d3ee0:	48 c1 e8 03          	shr    $0x3,%rax
0ed4  24d3ee4:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0ed8  24d3ee8:	84 c0                	test   %al,%al
0eda  24d3eea:	0f 85 54 11 00 00    	jne    24d5044 <skl_check_plane_surface+0x2034>
0ee0  24d3ef0:	44 0f b6 33          	movzbl (%rbx),%r14d
0ee4  24d3ef4:	49 83 fe 03          	cmp    $0x3,%r14
0ee8  24d3ef8:	0f 87 b1 00 00 00    	ja     24d3faf <skl_check_plane_surface+0xf9f>
0eee  24d3efe:	41 c1 e6 04          	shl    $0x4,%r14d
0ef2  24d3f02:	4b 8d 9c 34 fc 00 00 00 	lea    0xfc(%r12,%r14,1),%rbx
0efa  24d3f0a:	48 8d 7b f4          	lea    -0xc(%rbx),%rdi
0efe  24d3f0e:	48 89 f8             	mov    %rdi,%rax
0f01  24d3f11:	48 c1 e8 03          	shr    $0x3,%rax
0f05  24d3f15:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0f09  24d3f19:	84 c0                	test   %al,%al
0f0b  24d3f1b:	75 56                	jne    24d3f73 <skl_check_plane_surface+0xf63>
0f0d  24d3f1d:	48 8d 7b fc          	lea    -0x4(%rbx),%rdi
0f11  24d3f21:	43 c7 84 34 f0 00 00 00 00 f0 ff ff 	movl   $0xfffff000,0xf0(%r12,%r14,1)
0f1d  24d3f2d:	48 89 f8             	mov    %rdi,%rax
0f20  24d3f30:	48 c1 e8 03          	shr    $0x3,%rax
0f24  24d3f34:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0f28  24d3f38:	84 c0                	test   %al,%al
0f2a  24d3f3a:	75 4a                	jne    24d3f86 <skl_check_plane_surface+0xf76>
0f2c  24d3f3c:	48 89 d8             	mov    %rbx,%rax
0f2f  24d3f3f:	43 c7 84 34 f8 00 00 00 00 00 00 00 	movl   $0x0,0xf8(%r12,%r14,1)
0f3b  24d3f4b:	48 c1 e8 03          	shr    $0x3,%rax
0f3f  24d3f4f:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
0f43  24d3f53:	84 c0                	test   %al,%al
0f45  24d3f55:	75 42                	jne    24d3f99 <skl_check_plane_surface+0xf89>
0f47  24d3f57:	43 c7 84 34 fc 00 00 00 00 00 00 00 	movl   $0x0,0xfc(%r12,%r14,1)
0f53  24d3f63:	49 83 c6 10          	add    $0x10,%r14
0f57  24d3f67:	48 83 c3 10          	add    $0x10,%rbx
0f5b  24d3f6b:	49 83 fe 40          	cmp    $0x40,%r14
0f5f  24d3f6f:	75 99                	jne    24d3f0a <skl_check_plane_surface+0xefa>
0f61  24d3f71:	eb 3c                	jmp    24d3faf <skl_check_plane_surface+0xf9f>
0f63  24d3f73:	89 f9                	mov    %edi,%ecx
0f65  24d3f75:	80 e1 07             	and    $0x7,%cl
0f68  24d3f78:	80 c1 03             	add    $0x3,%cl
0f6b  24d3f7b:	38 c1                	cmp    %al,%cl
0f6d  24d3f7d:	7c 9e                	jl     24d3f1d <skl_check_plane_surface+0xf0d>
0f6f  24d3f7f:	e8 00 00 00 00       	call   24d3f84 <skl_check_plane_surface+0xf74>	24d3f80: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0f74  24d3f84:	eb 97                	jmp    24d3f1d <skl_check_plane_surface+0xf0d>
0f76  24d3f86:	89 f9                	mov    %edi,%ecx
0f78  24d3f88:	80 e1 07             	and    $0x7,%cl
0f7b  24d3f8b:	80 c1 03             	add    $0x3,%cl
0f7e  24d3f8e:	38 c1                	cmp    %al,%cl
0f80  24d3f90:	7c aa                	jl     24d3f3c <skl_check_plane_surface+0xf2c>
0f82  24d3f92:	e8 00 00 00 00       	call   24d3f97 <skl_check_plane_surface+0xf87>	24d3f93: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0f87  24d3f97:	eb a3                	jmp    24d3f3c <skl_check_plane_surface+0xf2c>
0f89  24d3f99:	89 d9                	mov    %ebx,%ecx
0f8b  24d3f9b:	80 e1 07             	and    $0x7,%cl
0f8e  24d3f9e:	80 c1 03             	add    $0x3,%cl
0f91  24d3fa1:	38 c1                	cmp    %al,%cl
0f93  24d3fa3:	7c b2                	jl     24d3f57 <skl_check_plane_surface+0xf47>
0f95  24d3fa5:	48 89 df             	mov    %rbx,%rdi
0f98  24d3fa8:	e8 00 00 00 00       	call   24d3fad <skl_check_plane_surface+0xf9d>	24d3fa9: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0f9d  24d3fad:	eb a8                	jmp    24d3f57 <skl_check_plane_surface+0xf47>
0f9f  24d3faf:	4c 89 e0             	mov    %r12,%rax
0fa2  24d3fb2:	48 c1 e8 03          	shr    $0x3,%rax
0fa6  24d3fb6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0faa  24d3fba:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0faf  24d3fbf:	74 08                	je     24d3fc9 <skl_check_plane_surface+0xfb9>
0fb1  24d3fc1:	4c 89 e7             	mov    %r12,%rdi
0fb4  24d3fc4:	e8 00 00 00 00       	call   24d3fc9 <skl_check_plane_surface+0xfb9>	24d3fc5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fb9  24d3fc9:	49 8b 1c 24          	mov    (%r12),%rbx
0fbd  24d3fcd:	48 89 d8             	mov    %rbx,%rax
0fc0  24d3fd0:	48 c1 e8 03          	shr    $0x3,%rax
0fc4  24d3fd4:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0fc8  24d3fd8:	74 08                	je     24d3fe2 <skl_check_plane_surface+0xfd2>
0fca  24d3fda:	48 89 df             	mov    %rbx,%rdi
0fcd  24d3fdd:	e8 00 00 00 00       	call   24d3fe2 <skl_check_plane_surface+0xfd2>	24d3fde: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fd2  24d3fe2:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
0fda  24d3fea:	48 8b 03             	mov    (%rbx),%rax
0fdd  24d3fed:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0fe1  24d3ff1:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0fe6  24d3ff6:	74 0d                	je     24d4005 <skl_check_plane_surface+0xff5>
0fe8  24d3ff8:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
0ff0  24d4000:	e8 00 00 00 00       	call   24d4005 <skl_check_plane_surface+0xff5>	24d4001: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ff5  24d4005:	49 8d 4c 24 60       	lea    0x60(%r12),%rcx
0ffa  24d400a:	49 8b 9c 24 a0 00 00 00 	mov    0xa0(%r12),%rbx
1002  24d4012:	48 89 c8             	mov    %rcx,%rax
1005  24d4015:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
100a  24d401a:	48 c1 e9 03          	shr    $0x3,%rcx
100e  24d401e:	0f b6 04 29          	movzbl (%rcx,%rbp,1),%eax
1012  24d4022:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
1017  24d4027:	84 c0                	test   %al,%al
1019  24d4029:	0f 85 2f 10 00 00    	jne    24d505e <skl_check_plane_surface+0x204e>
101f  24d402f:	49 8d 4c 24 64       	lea    0x64(%r12),%rcx
1024  24d4034:	45 8b 74 24 60       	mov    0x60(%r12),%r14d
1029  24d4039:	48 89 c8             	mov    %rcx,%rax
102c  24d403c:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
1031  24d4041:	48 c1 e9 03          	shr    $0x3,%rcx
1035  24d4045:	0f b6 04 29          	movzbl (%rcx,%rbp,1),%eax
1039  24d4049:	48 89 8c 24 90 00 00 00 	mov    %rcx,0x90(%rsp)
1041  24d4051:	84 c0                	test   %al,%al
1043  24d4053:	0f 85 27 10 00 00    	jne    24d5080 <skl_check_plane_surface+0x2070>
1049  24d4059:	41 8b 44 24 64       	mov    0x64(%r12),%eax
104e  24d405e:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
1053  24d4063:	49 8d 5c 24 68       	lea    0x68(%r12),%rbx
1058  24d4068:	44 89 74 24 60       	mov    %r14d,0x60(%rsp)
105d  24d406d:	89 44 24 28          	mov    %eax,0x28(%rsp)
1061  24d4071:	48 89 d8             	mov    %rbx,%rax
1064  24d4074:	48 c1 e8 03          	shr    $0x3,%rax
1068  24d4078:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
1070  24d4080:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1074  24d4084:	84 c0                	test   %al,%al
1076  24d4086:	0f 85 16 10 00 00    	jne    24d50a2 <skl_check_plane_surface+0x2092>
107c  24d408c:	4d 8d 74 24 6c       	lea    0x6c(%r12),%r14
1081  24d4091:	45 8b 4c 24 68       	mov    0x68(%r12),%r9d
1086  24d4096:	4c 89 f0             	mov    %r14,%rax
1089  24d4099:	48 c1 e8 03          	shr    $0x3,%rax
108d  24d409d:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
1095  24d40a5:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1099  24d40a9:	45 89 cf             	mov    %r9d,%r15d
109c  24d40ac:	84 c0                	test   %al,%al
109e  24d40ae:	0f 85 0b 10 00 00    	jne    24d50bf <skl_check_plane_surface+0x20af>
10a4  24d40b4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
10a9  24d40b9:	48 89 9c 24 c0 00 00 00 	mov    %rbx,0xc0(%rsp)
10b1  24d40c1:	45 8b 06             	mov    (%r14),%r8d
10b4  24d40c4:	48 8d 58 78          	lea    0x78(%rax),%rbx
10b8  24d40c8:	44 89 04 24          	mov    %r8d,(%rsp)
10bc  24d40cc:	48 89 d8             	mov    %rbx,%rax
10bf  24d40cf:	48 c1 e8 03          	shr    $0x3,%rax
10c3  24d40d3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
10c7  24d40d7:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
10cf  24d40df:	74 0f                	je     24d40f0 <skl_check_plane_surface+0x10e0>
10d1  24d40e1:	48 89 df             	mov    %rbx,%rdi
10d4  24d40e4:	e8 00 00 00 00       	call   24d40e9 <skl_check_plane_surface+0x10d9>	24d40e5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
10d9  24d40e9:	44 8b 04 24          	mov    (%rsp),%r8d
10dd  24d40ed:	45 89 f9             	mov    %r15d,%r9d
10e0  24d40f0:	48 8b 03             	mov    (%rbx),%rax
10e3  24d40f3:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
10e8  24d40f8:	b1 01                	mov    $0x1,%cl
10ea  24d40fa:	b3 01                	mov    $0x1,%bl
10ec  24d40fc:	89 8c 24 a8 00 00 00 	mov    %ecx,0xa8(%rsp)
10f3  24d4103:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
10f7  24d4107:	4c 39 e8             	cmp    %r13,%rax
10fa  24d410a:	75 58                	jne    24d4164 <skl_check_plane_surface+0x1154>
10fc  24d410c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
1101  24d4111:	48 8d 58 48          	lea    0x48(%rax),%rbx
1105  24d4115:	48 89 d8             	mov    %rbx,%rax
1108  24d4118:	48 c1 e8 03          	shr    $0x3,%rax
110c  24d411c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
1110  24d4120:	74 08                	je     24d412a <skl_check_plane_surface+0x111a>
1112  24d4122:	48 89 df             	mov    %rbx,%rdi
1115  24d4125:	e8 00 00 00 00       	call   24d412a <skl_check_plane_surface+0x111a>	24d4126: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
111a  24d412a:	48 8b 1b             	mov    (%rbx),%rbx
111d  24d412d:	48 83 c3 05          	add    $0x5,%rbx
1121  24d4131:	48 89 d8             	mov    %rbx,%rax
1124  24d4134:	48 c1 e8 03          	shr    $0x3,%rax
1128  24d4138:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
112c  24d413c:	84 c0                	test   %al,%al
112e  24d413e:	0f 85 75 10 00 00    	jne    24d51b9 <skl_check_plane_surface+0x21a9>
1134  24d4144:	0f b6 03             	movzbl (%rbx),%eax
1137  24d4147:	44 8b 04 24          	mov    (%rsp),%r8d
113b  24d414b:	89 c3                	mov    %eax,%ebx
113d  24d414d:	d1 eb                	shr    %ebx
113f  24d414f:	83 f8 08             	cmp    $0x8,%eax
1142  24d4152:	b0 01                	mov    $0x1,%al
1144  24d4154:	89 84 24 a8 00 00 00 	mov    %eax,0xa8(%rsp)
114b  24d415b:	0f 83 8b 16 00 00    	jae    24d57ec <skl_check_plane_surface+0x27dc>
1151  24d4161:	45 89 f9             	mov    %r15d,%r9d
1154  24d4164:	0f b6 c3             	movzbl %bl,%eax
1157  24d4167:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
115c  24d416c:	49 89 ee             	mov    %rbp,%r14
115f  24d416f:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
1164  24d4174:	c1 e0 04             	shl    $0x4,%eax
1167  24d4177:	49 8d 9c 04 f0 00 00 00 	lea    0xf0(%r12,%rax,1),%rbx
116f  24d417f:	48 89 d8             	mov    %rbx,%rax
1172  24d4182:	48 c1 e8 03          	shr    $0x3,%rax
1176  24d4186:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
117a  24d418a:	84 c0                	test   %al,%al
117c  24d418c:	0f 85 4e 0f 00 00    	jne    24d50e0 <skl_check_plane_surface+0x20d0>
1182  24d4192:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
1187  24d4197:	44 8b 2b             	mov    (%rbx),%r13d
118a  24d419a:	4c 8d a0 1a 10 00 00 	lea    0x101a(%rax),%r12
1191  24d41a1:	4c 89 e5             	mov    %r12,%rbp
1194  24d41a4:	48 c1 ed 03          	shr    $0x3,%rbp
1198  24d41a8:	42 0f b6 44 35 00    	movzbl 0x0(%rbp,%r14,1),%eax
119e  24d41ae:	84 c0                	test   %al,%al
11a0  24d41b0:	0f 85 4e 0f 00 00    	jne    24d5104 <skl_check_plane_surface+0x20f4>
11a6  24d41b6:	41 0f b6 04 24       	movzbl (%r12),%eax
11ab  24d41bb:	44 2b 4c 24 60       	sub    0x60(%rsp),%r9d
11b0  24d41c0:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
11b5  24d41c5:	3c 0b                	cmp    $0xb,%al
11b7  24d41c7:	0f 82 a1 00 00 00    	jb     24d426e <skl_check_plane_surface+0x125e>
11bd  24d41cd:	48 8d 5a 48          	lea    0x48(%rdx),%rbx
11c1  24d41d1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
11cb  24d41db:	44 8b 7c 24 28       	mov    0x28(%rsp),%r15d
11d0  24d41e0:	48 89 d8             	mov    %rbx,%rax
11d3  24d41e3:	48 c1 e8 03          	shr    $0x3,%rax
11d7  24d41e7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
11db  24d41eb:	74 12                	je     24d41ff <skl_check_plane_surface+0x11ef>
11dd  24d41ed:	48 89 df             	mov    %rbx,%rdi
11e0  24d41f0:	45 89 ce             	mov    %r9d,%r14d
11e3  24d41f3:	e8 00 00 00 00       	call   24d41f8 <skl_check_plane_surface+0x11e8>	24d41f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
11e8  24d41f8:	44 8b 04 24          	mov    (%rsp),%r8d
11ec  24d41fc:	45 89 f1             	mov    %r14d,%r9d
11ef  24d41ff:	48 8b 1b             	mov    (%rbx),%rbx
11f2  24d4202:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
11fc  24d420c:	48 89 d8             	mov    %rbx,%rax
11ff  24d420f:	48 c1 e8 03          	shr    $0x3,%rax
1203  24d4213:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1207  24d4217:	84 c0                	test   %al,%al
1209  24d4219:	0f 85 b4 0f 00 00    	jne    24d51d3 <skl_check_plane_surface+0x21c3>
120f  24d421f:	8b 03                	mov    (%rbx),%eax
1211  24d4221:	41 be 00 14 00 00    	mov    $0x1400,%r14d
1217  24d4227:	3d 57 42 32 34       	cmp    $0x34324257,%eax
121c  24d422c:	0f 8e ef 01 00 00    	jle    24d4421 <skl_check_plane_surface+0x1411>
1222  24d4232:	3d 57 56 33 36       	cmp    $0x36335657,%eax
1227  24d4237:	0f 8f 47 02 00 00    	jg     24d4484 <skl_check_plane_surface+0x1474>
122d  24d423d:	3d 4f 30 31 36       	cmp    $0x3631304f,%eax
1232  24d4242:	0f 8f 82 02 00 00    	jg     24d44ca <skl_check_plane_surface+0x14ba>
1238  24d4248:	3d 58 42 32 34       	cmp    $0x34324258,%eax
123d  24d424d:	0f 84 de 02 00 00    	je     24d4531 <skl_check_plane_surface+0x1521>
1243  24d4253:	3d 41 52 32 34       	cmp    $0x34325241,%eax
1248  24d4258:	0f 84 d3 02 00 00    	je     24d4531 <skl_check_plane_surface+0x1521>
124e  24d425e:	3d 58 52 32 34       	cmp    $0x34325258,%eax
1253  24d4263:	0f 84 c8 02 00 00    	je     24d4531 <skl_check_plane_surface+0x1521>
1259  24d4269:	e9 7c 03 00 00       	jmp    24d45ea <skl_check_plane_surface+0x15da>
125e  24d426e:	3c 0a                	cmp    $0xa,%al
1260  24d4270:	0f 84 ff 00 00 00    	je     24d4375 <skl_check_plane_surface+0x1365>
1266  24d4276:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
126b  24d427b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1275  24d4285:	48 8d 98 a4 10 00 00 	lea    0x10a4(%rax),%rbx
127c  24d428c:	48 89 d8             	mov    %rbx,%rax
127f  24d428f:	48 c1 e8 03          	shr    $0x3,%rax
1283  24d4293:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
1287  24d4297:	84 c0                	test   %al,%al
1289  24d4299:	0f 85 d7 12 00 00    	jne    24d5576 <skl_check_plane_surface+0x2566>
128f  24d429f:	f6 43 03 10          	testb  $0x10,0x3(%rbx)
1293  24d42a3:	0f 85 cc 00 00 00    	jne    24d4375 <skl_check_plane_surface+0x1365>
1299  24d42a9:	48 8d 5a 48          	lea    0x48(%rdx),%rbx
129d  24d42ad:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
12a7  24d42b7:	48 89 d8             	mov    %rbx,%rax
12aa  24d42ba:	48 c1 e8 03          	shr    $0x3,%rax
12ae  24d42be:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
12b2  24d42c2:	74 12                	je     24d42d6 <skl_check_plane_surface+0x12c6>
12b4  24d42c4:	48 89 df             	mov    %rbx,%rdi
12b7  24d42c7:	45 89 ce             	mov    %r9d,%r14d
12ba  24d42ca:	e8 00 00 00 00       	call   24d42cf <skl_check_plane_surface+0x12bf>	24d42cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12bf  24d42cf:	44 8b 04 24          	mov    (%rsp),%r8d
12c3  24d42d3:	45 89 f1             	mov    %r14d,%r9d
12c6  24d42d6:	48 8b 1b             	mov    (%rbx),%rbx
12c9  24d42d9:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
12d3  24d42e3:	48 83 c3 06          	add    $0x6,%rbx
12d7  24d42e7:	48 89 d8             	mov    %rbx,%rax
12da  24d42ea:	48 c1 e8 03          	shr    $0x3,%rax
12de  24d42ee:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
12e3  24d42f3:	84 c0                	test   %al,%al
12e5  24d42f5:	0f 85 ca 13 00 00    	jne    24d56c5 <skl_check_plane_surface+0x26b5>
12eb  24d42fb:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
12f3  24d4303:	0f b6 1b             	movzbl (%rbx),%ebx
12f6  24d4306:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
12fb  24d430b:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1300  24d4310:	74 12                	je     24d4324 <skl_check_plane_surface+0x1314>
1302  24d4312:	4c 89 ff             	mov    %r15,%rdi
1305  24d4315:	45 89 ce             	mov    %r9d,%r14d
1308  24d4318:	e8 00 00 00 00       	call   24d431d <skl_check_plane_surface+0x130d>	24d4319: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
130d  24d431d:	44 8b 04 24          	mov    (%rsp),%r8d
1311  24d4321:	45 89 f1             	mov    %r14d,%r9d
1314  24d4324:	49 8b 17             	mov    (%r15),%rdx
1317  24d4327:	48 b8 01 00 00 00 00 00 00 01 	movabs $0x100000000000001,%rax
1321  24d4331:	48 39 c2             	cmp    %rax,%rdx
1324  24d4334:	0f 8e 42 02 00 00    	jle    24d457c <skl_check_plane_surface+0x156c>
132a  24d433a:	44 8b 7c 24 28       	mov    0x28(%rsp),%r15d
132f  24d433f:	48 b8 fe ff ff ff ff ff ff fe 	movabs $0xfefffffffffffffe,%rax
1339  24d4349:	48 01 d0             	add    %rdx,%rax
133c  24d434c:	48 83 f8 04          	cmp    $0x4,%rax
1340  24d4350:	0f 83 4e 02 00 00    	jae    24d45a4 <skl_check_plane_surface+0x1594>
1346  24d4356:	45 31 f6             	xor    %r14d,%r14d
1349  24d4359:	80 fb 08             	cmp    $0x8,%bl
134c  24d435c:	bb 01 00 00 00       	mov    $0x1,%ebx
1351  24d4361:	41 0f 95 c6          	setne  %r14b
1355  24d4365:	41 c1 e6 0b          	shl    $0xb,%r14d
1359  24d4369:	41 81 c6 00 08 00 00 	add    $0x800,%r14d
1360  24d4370:	e9 7a 02 00 00       	jmp    24d45ef <skl_check_plane_surface+0x15df>
1365  24d4375:	48 8d 5a 48          	lea    0x48(%rdx),%rbx
1369  24d4379:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1373  24d4383:	45 89 cf             	mov    %r9d,%r15d
1376  24d4386:	48 89 d8             	mov    %rbx,%rax
1379  24d4389:	48 c1 e8 03          	shr    $0x3,%rax
137d  24d438d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1381  24d4391:	74 0c                	je     24d439f <skl_check_plane_surface+0x138f>
1383  24d4393:	48 89 df             	mov    %rbx,%rdi
1386  24d4396:	e8 00 00 00 00       	call   24d439b <skl_check_plane_surface+0x138b>	24d4397: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
138b  24d439b:	44 8b 04 24          	mov    (%rsp),%r8d
138f  24d439f:	48 8b 1b             	mov    (%rbx),%rbx
1392  24d43a2:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
139c  24d43ac:	48 83 c3 06          	add    $0x6,%rbx
13a0  24d43b0:	48 89 d8             	mov    %rbx,%rax
13a3  24d43b3:	48 c1 e8 03          	shr    $0x3,%rax
13a7  24d43b7:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
13ac  24d43bc:	84 c0                	test   %al,%al
13ae  24d43be:	0f 85 3f 10 00 00    	jne    24d5403 <skl_check_plane_surface+0x23f3>
13b4  24d43c4:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
13bc  24d43cc:	0f b6 1b             	movzbl (%rbx),%ebx
13bf  24d43cf:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
13c4  24d43d4:	4c 8b 74 24 78       	mov    0x78(%rsp),%r14
13c9  24d43d9:	74 0c                	je     24d43e7 <skl_check_plane_surface+0x13d7>
13cb  24d43db:	4c 89 f7             	mov    %r14,%rdi
13ce  24d43de:	e8 00 00 00 00       	call   24d43e3 <skl_check_plane_surface+0x13d3>	24d43df: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13d3  24d43e3:	44 8b 04 24          	mov    (%rsp),%r8d
13d7  24d43e7:	49 8b 16             	mov    (%r14),%rdx
13da  24d43ea:	48 b8 fe ff ff ff ff ff ff fe 	movabs $0xfefffffffffffffe,%rax
13e4  24d43f4:	48 01 d0             	add    %rdx,%rax
13e7  24d43f7:	48 83 f8 04          	cmp    $0x4,%rax
13eb  24d43fb:	73 5c                	jae    24d4459 <skl_check_plane_surface+0x1449>
13ed  24d43fd:	45 89 f9             	mov    %r15d,%r9d
13f0  24d4400:	44 8b 7c 24 28       	mov    0x28(%rsp),%r15d
13f5  24d4405:	80 fb 08             	cmp    $0x8,%bl
13f8  24d4408:	b8 00 08 00 00       	mov    $0x800,%eax
13fd  24d440d:	41 be 00 14 00 00    	mov    $0x1400,%r14d
1403  24d4413:	bb 01 00 00 00       	mov    $0x1,%ebx
1408  24d4418:	44 0f 44 f0          	cmove  %eax,%r14d
140c  24d441c:	e9 ce 01 00 00       	jmp    24d45ef <skl_check_plane_surface+0x15df>
1411  24d4421:	3d 57 52 33 30       	cmp    $0x30335257,%eax
1416  24d4426:	7e 7d                	jle    24d44a5 <skl_check_plane_surface+0x1495>
1418  24d4428:	3d 58 32 31 32       	cmp    $0x32313258,%eax
141d  24d442d:	0f 8f e1 00 00 00    	jg     24d4514 <skl_check_plane_surface+0x1504>
1423  24d4433:	3d 58 52 33 30       	cmp    $0x30335258,%eax
1428  24d4438:	0f 84 f3 00 00 00    	je     24d4531 <skl_check_plane_surface+0x1521>
142e  24d443e:	3d 58 56 33 30       	cmp    $0x30335658,%eax
1433  24d4443:	0f 84 e8 00 00 00    	je     24d4531 <skl_check_plane_surface+0x1521>
1439  24d4449:	3d 50 30 31 32       	cmp    $0x32313050,%eax
143e  24d444e:	0f 84 21 01 00 00    	je     24d4575 <skl_check_plane_surface+0x1565>
1444  24d4454:	e9 91 01 00 00       	jmp    24d45ea <skl_check_plane_surface+0x15da>
1449  24d4459:	48 b8 01 00 00 00 00 00 00 01 	movabs $0x100000000000001,%rax
1453  24d4463:	45 89 f9             	mov    %r15d,%r9d
1456  24d4466:	48 39 c2             	cmp    %rax,%rdx
1459  24d4469:	74 09                	je     24d4474 <skl_check_plane_surface+0x1464>
145b  24d446b:	48 85 d2             	test   %rdx,%rdx
145e  24d446e:	0f 85 c7 00 00 00    	jne    24d453b <skl_check_plane_surface+0x152b>
1464  24d4474:	45 31 f6             	xor    %r14d,%r14d
1467  24d4477:	80 fb 08             	cmp    $0x8,%bl
146a  24d447a:	44 8b 7c 24 28       	mov    0x28(%rsp),%r15d
146f  24d447f:	e9 0d 01 00 00       	jmp    24d4591 <skl_check_plane_surface+0x1581>
1474  24d4484:	3d 57 42 34 48       	cmp    $0x48344257,%eax
1479  24d4489:	7f 66                	jg     24d44f1 <skl_check_plane_surface+0x14e1>
147b  24d448b:	3d 58 56 33 36       	cmp    $0x36335658,%eax
1480  24d4490:	74 78                	je     24d450a <skl_check_plane_surface+0x14fa>
1482  24d4492:	3d 58 56 34 38       	cmp    $0x38345658,%eax
1487  24d4497:	74 71                	je     24d450a <skl_check_plane_surface+0x14fa>
1489  24d4499:	3d 41 42 34 48       	cmp    $0x48344241,%eax
148e  24d449e:	74 6a                	je     24d450a <skl_check_plane_surface+0x14fa>
1490  24d44a0:	e9 45 01 00 00       	jmp    24d45ea <skl_check_plane_surface+0x15da>
1495  24d44a5:	3d 40 42 33 30       	cmp    $0x30334240,%eax
149a  24d44aa:	0f 8e ae 00 00 00    	jle    24d455e <skl_check_plane_surface+0x154e>
14a0  24d44b0:	3d 41 42 33 30       	cmp    $0x30334241,%eax
14a5  24d44b5:	74 7a                	je     24d4531 <skl_check_plane_surface+0x1521>
14a7  24d44b7:	3d 58 42 33 30       	cmp    $0x30334258,%eax
14ac  24d44bc:	74 73                	je     24d4531 <skl_check_plane_surface+0x1521>
14ae  24d44be:	3d 41 52 33 30       	cmp    $0x30335241,%eax
14b3  24d44c3:	74 6c                	je     24d4531 <skl_check_plane_surface+0x1521>
14b5  24d44c5:	e9 20 01 00 00       	jmp    24d45ea <skl_check_plane_surface+0x15da>
14ba  24d44ca:	3d 50 30 31 36       	cmp    $0x36313050,%eax
14bf  24d44cf:	0f 84 a0 00 00 00    	je     24d4575 <skl_check_plane_surface+0x1565>
14c5  24d44d5:	3d 59 32 31 36       	cmp    $0x36313259,%eax
14ca  24d44da:	74 55                	je     24d4531 <skl_check_plane_surface+0x1521>
14cc  24d44dc:	3d 52 47 31 36       	cmp    $0x36314752,%eax
14d1  24d44e1:	0f 85 03 01 00 00    	jne    24d45ea <skl_check_plane_surface+0x15da>
14d7  24d44e7:	bb 0a 00 00 00       	mov    $0xa,%ebx
14dc  24d44ec:	e9 fe 00 00 00       	jmp    24d45ef <skl_check_plane_surface+0x15df>
14e1  24d44f1:	3d 58 42 34 48       	cmp    $0x48344258,%eax
14e6  24d44f6:	74 12                	je     24d450a <skl_check_plane_surface+0x14fa>
14e8  24d44f8:	3d 41 52 34 48       	cmp    $0x48345241,%eax
14ed  24d44fd:	74 0b                	je     24d450a <skl_check_plane_surface+0x14fa>
14ef  24d44ff:	3d 58 52 34 48       	cmp    $0x48345258,%eax
14f4  24d4504:	0f 85 e0 00 00 00    	jne    24d45ea <skl_check_plane_surface+0x15da>
14fa  24d450a:	bb 04 00 00 00       	mov    $0x4,%ebx
14ff  24d450f:	e9 db 00 00 00       	jmp    24d45ef <skl_check_plane_surface+0x15df>
1504  24d4514:	3d 59 32 31 32       	cmp    $0x32313259,%eax
1509  24d4519:	74 16                	je     24d4531 <skl_check_plane_surface+0x1521>
150b  24d451b:	3d 4e 56 31 32       	cmp    $0x3231564e,%eax
1510  24d4520:	0f 84 bd 00 00 00    	je     24d45e3 <skl_check_plane_surface+0x15d3>
1516  24d4526:	3d 41 42 32 34       	cmp    $0x34324241,%eax
151b  24d452b:	0f 85 b9 00 00 00    	jne    24d45ea <skl_check_plane_surface+0x15da>
1521  24d4531:	bb 06 00 00 00       	mov    $0x6,%ebx
1526  24d4536:	e9 b4 00 00 00       	jmp    24d45ef <skl_check_plane_surface+0x15df>
152b  24d453b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d453e: R_X86_64_32S	.rodata+0x9de560
1532  24d4542:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	24d4545: R_X86_64_32S	.rodata+0x9e28a0
1539  24d4549:	e8 00 00 00 00       	call   24d454e <skl_check_plane_surface+0x153e>	24d454a: R_X86_64_PLT32	__warn_printk-0x4
153e  24d454e:	44 8b 04 24          	mov    (%rsp),%r8d
1542  24d4552:	0f 0b                	ud2
1544  24d4554:	45 89 f9             	mov    %r15d,%r9d
1547  24d4557:	44 8b 7c 24 28       	mov    0x28(%rsp),%r15d
154c  24d455c:	eb 78                	jmp    24d45d6 <skl_check_plane_surface+0x15c6>
154e  24d455e:	bb 12 00 00 00       	mov    $0x12,%ebx
1553  24d4563:	3d 43 38 20 20       	cmp    $0x20203843,%eax
1558  24d4568:	0f 84 81 00 00 00    	je     24d45ef <skl_check_plane_surface+0x15df>
155e  24d456e:	3d 50 30 31 30       	cmp    $0x30313050,%eax
1563  24d4573:	75 75                	jne    24d45ea <skl_check_plane_surface+0x15da>
1565  24d4575:	bb 0c 00 00 00       	mov    $0xc,%ebx
156a  24d457a:	eb 73                	jmp    24d45ef <skl_check_plane_surface+0x15df>
156c  24d457c:	44 8b 7c 24 28       	mov    0x28(%rsp),%r15d
1571  24d4581:	48 85 d2             	test   %rdx,%rdx
1574  24d4584:	74 05                	je     24d458b <skl_check_plane_surface+0x157b>
1576  24d4586:	48 39 c2             	cmp    %rax,%rdx
1579  24d4589:	75 2c                	jne    24d45b7 <skl_check_plane_surface+0x15a7>
157b  24d458b:	45 31 f6             	xor    %r14d,%r14d
157e  24d458e:	80 fb 08             	cmp    $0x8,%bl
1581  24d4591:	bb 01 00 00 00       	mov    $0x1,%ebx
1586  24d4596:	41 0f 95 c6          	setne  %r14b
158a  24d459a:	41 83 ce 04          	or     $0x4,%r14d
158e  24d459e:	41 c1 e6 0a          	shl    $0xa,%r14d
1592  24d45a2:	eb 4b                	jmp    24d45ef <skl_check_plane_surface+0x15df>
1594  24d45a4:	48 b8 07 00 00 00 00 00 00 01 	movabs $0x100000000000007,%rax
159e  24d45ae:	48 39 c2             	cmp    %rax,%rdx
15a1  24d45b1:	0f 84 9f fd ff ff    	je     24d4356 <skl_check_plane_surface+0x1346>
15a7  24d45b7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d45ba: R_X86_64_32S	.rodata+0x9de560
15ae  24d45be:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	24d45c1: R_X86_64_32S	.rodata+0x9e28a0
15b5  24d45c5:	44 89 cb             	mov    %r9d,%ebx
15b8  24d45c8:	e8 00 00 00 00       	call   24d45cd <skl_check_plane_surface+0x15bd>	24d45c9: R_X86_64_PLT32	__warn_printk-0x4
15bd  24d45cd:	44 8b 04 24          	mov    (%rsp),%r8d
15c1  24d45d1:	0f 0b                	ud2
15c3  24d45d3:	41 89 d9             	mov    %ebx,%r9d
15c6  24d45d6:	bb 01 00 00 00       	mov    $0x1,%ebx
15cb  24d45db:	41 be 00 08 00 00    	mov    $0x800,%r14d
15d1  24d45e1:	eb 0c                	jmp    24d45ef <skl_check_plane_surface+0x15df>
15d3  24d45e3:	bb 14 00 00 00       	mov    $0x14,%ebx
15d8  24d45e8:	eb 05                	jmp    24d45ef <skl_check_plane_surface+0x15df>
15da  24d45ea:	bb 01 00 00 00       	mov    $0x1,%ebx
15df  24d45ef:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
15e9  24d45f9:	41 c1 f9 10          	sar    $0x10,%r9d
15ed  24d45fd:	45 29 f8             	sub    %r15d,%r8d
15f0  24d4600:	0f b6 44 0d 00       	movzbl 0x0(%rbp,%rcx,1),%eax
15f5  24d4605:	48 89 cd             	mov    %rcx,%rbp
15f8  24d4608:	44 89 4c 24 14       	mov    %r9d,0x14(%rsp)
15fd  24d460d:	84 c0                	test   %al,%al
15ff  24d460f:	0f 85 11 0b 00 00    	jne    24d5126 <skl_check_plane_surface+0x2116>
1605  24d4615:	41 c1 f8 10          	sar    $0x10,%r8d
1609  24d4619:	41 80 3c 24 0b       	cmpb   $0xb,(%r12)
160e  24d461e:	b8 e0 10 00 00       	mov    $0x10e0,%eax
1613  24d4623:	41 bc 00 10 00 00    	mov    $0x1000,%r12d
1619  24d4629:	44 0f 43 e0          	cmovae %eax,%r12d
161d  24d462d:	45 39 f1             	cmp    %r14d,%r9d
1620  24d4630:	0f 8f b7 01 00 00    	jg     24d47ed <skl_check_plane_surface+0x17dd>
1626  24d4636:	41 39 d9             	cmp    %ebx,%r9d
1629  24d4639:	0f 8c ae 01 00 00    	jl     24d47ed <skl_check_plane_surface+0x17dd>
162f  24d463f:	45 39 e0             	cmp    %r12d,%r8d
1632  24d4642:	0f 8f a5 01 00 00    	jg     24d47ed <skl_check_plane_surface+0x17dd>
1638  24d4648:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
163d  24d464d:	44 8b 74 24 60       	mov    0x60(%rsp),%r14d
1642  24d4652:	49 8d 9c 24 f8 00 00 00 	lea    0xf8(%r12),%rbx
164a  24d465a:	41 c1 fe 10          	sar    $0x10,%r14d
164e  24d465e:	48 89 d8             	mov    %rbx,%rax
1651  24d4661:	48 c1 e8 03          	shr    $0x3,%rax
1655  24d4665:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
165d  24d466d:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1661  24d4671:	84 c0                	test   %al,%al
1663  24d4673:	0f 85 81 0b 00 00    	jne    24d51fa <skl_check_plane_surface+0x21ea>
1669  24d4679:	45 03 b4 24 f8 00 00 00 	add    0xf8(%r12),%r14d
1671  24d4681:	41 c1 ff 10          	sar    $0x10,%r15d
1675  24d4685:	44 89 74 24 0c       	mov    %r14d,0xc(%rsp)
167a  24d468a:	4d 8d b4 24 fc 00 00 00 	lea    0xfc(%r12),%r14
1682  24d4692:	4c 89 f0             	mov    %r14,%rax
1685  24d4695:	48 c1 e8 03          	shr    $0x3,%rax
1689  24d4699:	48 89 84 24 d8 00 00 00 	mov    %rax,0xd8(%rsp)
1691  24d46a1:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1695  24d46a5:	84 c0                	test   %al,%al
1697  24d46a7:	0f 85 6a 0b 00 00    	jne    24d5217 <skl_check_plane_surface+0x2207>
169d  24d46ad:	45 03 bc 24 fc 00 00 00 	add    0xfc(%r12),%r15d
16a5  24d46b5:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
16aa  24d46ba:	4c 89 b4 24 e8 00 00 00 	mov    %r14,0xe8(%rsp)
16b2  24d46c2:	44 89 7c 24 10       	mov    %r15d,0x10(%rsp)
16b7  24d46c7:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
16bb  24d46cb:	74 08                	je     24d46d5 <skl_check_plane_surface+0x16c5>
16bd  24d46cd:	4c 89 e7             	mov    %r12,%rdi
16c0  24d46d0:	e8 00 00 00 00       	call   24d46d5 <skl_check_plane_surface+0x16c5>	24d46d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16c5  24d46d5:	4d 8b 3c 24          	mov    (%r12),%r15
16c9  24d46d9:	48 89 9c 24 c8 00 00 00 	mov    %rbx,0xc8(%rsp)
16d1  24d46e1:	4c 89 f8             	mov    %r15,%rax
16d4  24d46e4:	48 c1 e8 03          	shr    $0x3,%rax
16d8  24d46e8:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
16dc  24d46ec:	74 08                	je     24d46f6 <skl_check_plane_surface+0x16e6>
16de  24d46ee:	4c 89 ff             	mov    %r15,%rdi
16e1  24d46f1:	e8 00 00 00 00       	call   24d46f6 <skl_check_plane_surface+0x16e6>	24d46f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16e6  24d46f6:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
16ee  24d46fe:	49 8b 1f             	mov    (%r15),%rbx
16f1  24d4701:	4c 8b b4 24 80 00 00 00 	mov    0x80(%rsp),%r14
16f9  24d4709:	49 8d 84 24 ac 00 00 00 	lea    0xac(%r12),%rax
1701  24d4711:	48 89 04 24          	mov    %rax,(%rsp)
1705  24d4715:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
1709  24d4719:	74 08                	je     24d4723 <skl_check_plane_surface+0x1713>
170b  24d471b:	4c 89 f7             	mov    %r14,%rdi
170e  24d471e:	e8 00 00 00 00       	call   24d4723 <skl_check_plane_surface+0x1713>	24d471f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1713  24d4723:	48 8b 04 24          	mov    (%rsp),%rax
1717  24d4727:	4d 8b 36             	mov    (%r14),%r14
171a  24d472a:	48 c1 e8 03          	shr    $0x3,%rax
171e  24d472e:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
1723  24d4733:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1727  24d4737:	84 c0                	test   %al,%al
1729  24d4739:	0f 85 f6 0a 00 00    	jne    24d5235 <skl_check_plane_surface+0x2225>
172f  24d473f:	45 8b 94 24 ac 00 00 00 	mov    0xac(%r12),%r10d
1737  24d4747:	49 81 c4 f4 00 00 00 	add    $0xf4,%r12
173e  24d474e:	4c 89 e0             	mov    %r12,%rax
1741  24d4751:	48 c1 e8 03          	shr    $0x3,%rax
1745  24d4755:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
174a  24d475a:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
174e  24d475e:	84 c0                	test   %al,%al
1750  24d4760:	0f 85 ef 0a 00 00    	jne    24d5255 <skl_check_plane_surface+0x2245>
1756  24d4766:	49 81 c7 94 05 00 00 	add    $0x594,%r15
175d  24d476d:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
1762  24d4772:	45 8b 24 24          	mov    (%r12),%r12d
1766  24d4776:	4c 89 f8             	mov    %r15,%rax
1769  24d4779:	48 c1 e8 03          	shr    $0x3,%rax
176d  24d477d:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1771  24d4781:	84 c0                	test   %al,%al
1773  24d4783:	0f 85 f4 0a 00 00    	jne    24d527d <skl_check_plane_surface+0x226d>
1779  24d4789:	41 83 3f 07          	cmpl   $0x7,(%r15)
177d  24d478d:	0f 85 ab 00 00 00    	jne    24d483e <skl_check_plane_surface+0x182e>
1783  24d4793:	4c 8d bb a4 10 00 00 	lea    0x10a4(%rbx),%r15
178a  24d479a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1794  24d47a4:	4c 89 f8             	mov    %r15,%rax
1797  24d47a7:	48 c1 e8 03          	shr    $0x3,%rax
179b  24d47ab:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
179f  24d47af:	84 c0                	test   %al,%al
17a1  24d47b1:	0f 85 eb 0d 00 00    	jne    24d55a2 <skl_check_plane_surface+0x2592>
17a7  24d47b7:	41 8b 0f             	mov    (%r15),%ecx
17aa  24d47ba:	b8 00 40 00 00       	mov    $0x4000,%eax
17af  24d47bf:	f6 c1 10             	test   $0x10,%cl
17b2  24d47c2:	0f 85 86 00 00 00    	jne    24d484e <skl_check_plane_surface+0x183e>
17b8  24d47c8:	b8 00 01 00 00       	mov    $0x100,%eax
17bd  24d47cd:	f6 c1 40             	test   $0x40,%cl
17c0  24d47d0:	75 7c                	jne    24d484e <skl_check_plane_surface+0x183e>
17c2  24d47d2:	b8 20 00 00 00       	mov    $0x20,%eax
17c7  24d47d7:	f6 c1 20             	test   $0x20,%cl
17ca  24d47da:	75 72                	jne    24d484e <skl_check_plane_surface+0x183e>
17cc  24d47dc:	84 c9                	test   %cl,%cl
17ce  24d47de:	b9 00 10 00 00       	mov    $0x1000,%ecx
17d3  24d47e3:	b8 20 00 00 00       	mov    $0x20,%eax
17d8  24d47e8:	0f 49 c1             	cmovns %ecx,%eax
17db  24d47eb:	eb 61                	jmp    24d484e <skl_check_plane_surface+0x183e>
17dd  24d47ed:	4c 8b 6c 24 68       	mov    0x68(%rsp),%r13
17e2  24d47f2:	49 83 c5 18          	add    $0x18,%r13
17e6  24d47f6:	4c 89 e8             	mov    %r13,%rax
17e9  24d47f9:	48 c1 e8 03          	shr    $0x3,%rax
17ed  24d47fd:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
17f1  24d4801:	74 13                	je     24d4816 <skl_check_plane_surface+0x1806>
17f3  24d4803:	4c 89 ef             	mov    %r13,%rdi
17f6  24d4806:	44 89 c5             	mov    %r8d,%ebp
17f9  24d4809:	e8 00 00 00 00       	call   24d480e <skl_check_plane_surface+0x17fe>	24d480a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
17fe  24d480e:	44 8b 4c 24 14       	mov    0x14(%rsp),%r9d
1803  24d4813:	41 89 e8             	mov    %ebp,%r8d
1806  24d4816:	49 8b 7d 00          	mov    0x0(%r13),%rdi
180a  24d481a:	44 89 c9             	mov    %r9d,%ecx
180d  24d481d:	be 04 00 00 00       	mov    $0x4,%esi
1812  24d4822:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	24d4825: R_X86_64_32S	.rodata+0x9e2f20
1819  24d4829:	41 89 d9             	mov    %ebx,%r9d
181c  24d482c:	41 54                	push   %r12
181e  24d482e:	41 56                	push   %r14
1820  24d4830:	e8 00 00 00 00       	call   24d4835 <skl_check_plane_surface+0x1825>	24d4831: R_X86_64_PLT32	drm_dev_dbg-0x4
1825  24d4835:	48 83 c4 10          	add    $0x10,%rsp
1829  24d4839:	e9 74 11 00 00       	jmp    24d59b2 <skl_check_plane_surface+0x29a2>
182e  24d483e:	4c 89 f7             	mov    %r14,%rdi
1831  24d4841:	31 f6                	xor    %esi,%esi
1833  24d4843:	4d 89 d7             	mov    %r10,%r15
1836  24d4846:	e8 85 d7 ff ff       	call   24d1fd0 <intel_surf_alignment>
183b  24d484b:	4d 89 fa             	mov    %r15,%r10
183e  24d484e:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
1843  24d4853:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
1848  24d4858:	48 89 df             	mov    %rbx,%rdi
184b  24d485b:	4c 89 f1             	mov    %r14,%rcx
184e  24d485e:	45 31 c0             	xor    %r8d,%r8d
1851  24d4861:	45 89 e1             	mov    %r12d,%r9d
1854  24d4864:	50                   	push   %rax
1855  24d4865:	41 52                	push   %r10
1857  24d4867:	e8 84 a5 04 00       	call   251edf0 <intel_compute_aligned_offset>
185c  24d486c:	48 83 c4 10          	add    $0x10,%rsp
1860  24d4870:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
1865  24d4875:	31 f6                	xor    %esi,%esi
1867  24d4877:	89 c3                	mov    %eax,%ebx
1869  24d4879:	4c 89 f7             	mov    %r14,%rdi
186c  24d487c:	e8 4f d7 ff ff       	call   24d1fd0 <intel_surf_alignment>
1871  24d4881:	8d 48 ff             	lea    -0x1(%rax),%ecx
1874  24d4884:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
1879  24d4889:	85 c8                	test   %ecx,%eax
187b  24d488b:	0f 85 aa 05 00 00    	jne    24d4e3b <skl_check_plane_surface+0x1e2b>
1881  24d4891:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
1889  24d4899:	44 39 eb             	cmp    %r13d,%ebx
188c  24d489c:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
1896  24d48a6:	76 7e                	jbe    24d4926 <skl_check_plane_surface+0x1916>
1898  24d48a8:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
18a0  24d48b0:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
18a5  24d48b5:	74 08                	je     24d48bf <skl_check_plane_surface+0x18af>
18a7  24d48b7:	4c 89 e7             	mov    %r12,%rdi
18aa  24d48ba:	e8 00 00 00 00       	call   24d48bf <skl_check_plane_surface+0x18af>	24d48bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
18af  24d48bf:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
18b4  24d48c4:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
18be  24d48ce:	49 8b 14 24          	mov    (%r12),%rdx
18c2  24d48d2:	89 c5                	mov    %eax,%ebp
18c4  24d48d4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
18c9  24d48d9:	f7 dd                	neg    %ebp
18cb  24d48db:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
18d0  24d48e0:	84 c0                	test   %al,%al
18d2  24d48e2:	0f 85 de 0c 00 00    	jne    24d55c6 <skl_check_plane_surface+0x25b6>
18d8  24d48e8:	48 8b 04 24          	mov    (%rsp),%rax
18dc  24d48ec:	41 21 ed             	and    %ebp,%r13d
18df  24d48ef:	44 8b 00             	mov    (%rax),%r8d
18e2  24d48f2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
18e7  24d48f7:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
18ec  24d48fc:	84 c0                	test   %al,%al
18ee  24d48fe:	0f 85 ed 0c 00 00    	jne    24d55f1 <skl_check_plane_surface+0x25e1>
18f4  24d4904:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
18f9  24d4909:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
18fe  24d490e:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
1903  24d4913:	31 c9                	xor    %ecx,%ecx
1905  24d4915:	44 8b 08             	mov    (%rax),%r9d
1908  24d4918:	41 55                	push   %r13
190a  24d491a:	53                   	push   %rbx
190b  24d491b:	e8 10 9c 04 00       	call   251e530 <intel_adjust_aligned_offset>
1910  24d4920:	48 83 c4 10          	add    $0x10,%rsp
1914  24d4924:	eb 03                	jmp    24d4929 <skl_check_plane_surface+0x1919>
1916  24d4926:	41 89 dd             	mov    %ebx,%r13d
1919  24d4929:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
1921  24d4931:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
1926  24d4936:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
192b  24d493b:	74 08                	je     24d4945 <skl_check_plane_surface+0x1935>
192d  24d493d:	48 89 df             	mov    %rbx,%rdi
1930  24d4940:	e8 00 00 00 00       	call   24d4945 <skl_check_plane_surface+0x1935>	24d4941: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1935  24d4945:	48 b8 04 00 00 00 00 00 00 01 	movabs $0x100000000000004,%rax
193f  24d494f:	48 83 c0 fd          	add    $0xfffffffffffffffd,%rax
1943  24d4953:	48 39 03             	cmp    %rax,(%rbx)
1946  24d4956:	0f 85 4d 01 00 00    	jne    24d4aa9 <skl_check_plane_surface+0x1a99>
194c  24d495c:	49 83 c6 48          	add    $0x48,%r14
1950  24d4960:	4c 89 f0             	mov    %r14,%rax
1953  24d4963:	48 c1 e8 03          	shr    $0x3,%rax
1957  24d4967:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
195c  24d496c:	74 08                	je     24d4976 <skl_check_plane_surface+0x1966>
195e  24d496e:	4c 89 f7             	mov    %r14,%rdi
1961  24d4971:	e8 00 00 00 00       	call   24d4976 <skl_check_plane_surface+0x1966>	24d4972: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1966  24d4976:	49 8b 1e             	mov    (%r14),%rbx
1969  24d4979:	48 83 c3 06          	add    $0x6,%rbx
196d  24d497d:	48 89 d8             	mov    %rbx,%rax
1970  24d4980:	48 c1 e8 03          	shr    $0x3,%rax
1974  24d4984:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
1979  24d4989:	84 c0                	test   %al,%al
197b  24d498b:	0f 85 9d 0c 00 00    	jne    24d562e <skl_check_plane_surface+0x261e>
1981  24d4991:	44 8b 74 24 0c       	mov    0xc(%rsp),%r14d
1986  24d4996:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
198b  24d499b:	0f b6 1b             	movzbl (%rbx),%ebx
198e  24d499e:	44 03 74 24 14       	add    0x14(%rsp),%r14d
1993  24d49a3:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
1998  24d49a8:	44 0f af f3          	imul   %ebx,%r14d
199c  24d49ac:	84 c0                	test   %al,%al
199e  24d49ae:	0f 85 94 0c 00 00    	jne    24d5648 <skl_check_plane_surface+0x2638>
19a4  24d49b4:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
19a9  24d49b9:	8b 28                	mov    (%rax),%ebp
19ab  24d49bb:	41 39 ee             	cmp    %ebp,%r14d
19ae  24d49be:	0f 86 e5 00 00 00    	jbe    24d4aa9 <skl_check_plane_surface+0x1a99>
19b4  24d49c4:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
19b9  24d49c9:	41 f7 de             	neg    %r14d
19bc  24d49cc:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
19c6  24d49d6:	45 85 ed             	test   %r13d,%r13d
19c9  24d49d9:	0f 84 79 03 00 00    	je     24d4d58 <skl_check_plane_surface+0x1d48>
19cf  24d49df:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
19d7  24d49e7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
19e1  24d49f1:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
19e5  24d49f5:	74 08                	je     24d49ff <skl_check_plane_surface+0x19ef>
19e7  24d49f7:	4c 89 e7             	mov    %r12,%rdi
19ea  24d49fa:	e8 00 00 00 00       	call   24d49ff <skl_check_plane_surface+0x19ef>	24d49fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19ef  24d49ff:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
19f4  24d4a04:	4d 8b 24 24          	mov    (%r12),%r12
19f8  24d4a08:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
19fd  24d4a0d:	84 c0                	test   %al,%al
19ff  24d4a0f:	75 64                	jne    24d4a75 <skl_check_plane_surface+0x1a65>
1a01  24d4a11:	48 8b 0c 24          	mov    (%rsp),%rcx
1a05  24d4a15:	43 8d 04 2e          	lea    (%r14,%r13,1),%eax
1a09  24d4a19:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
1a0e  24d4a1e:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
1a13  24d4a23:	4c 89 e2             	mov    %r12,%rdx
1a16  24d4a26:	41 89 e9             	mov    %ebp,%r9d
1a19  24d4a29:	44 8b 01             	mov    (%rcx),%r8d
1a1c  24d4a2c:	31 c9                	xor    %ecx,%ecx
1a1e  24d4a2e:	50                   	push   %rax
1a1f  24d4a2f:	41 55                	push   %r13
1a21  24d4a31:	e8 fa 9a 04 00       	call   251e530 <intel_adjust_aligned_offset>
1a26  24d4a36:	48 83 c4 10          	add    $0x10,%rsp
1a2a  24d4a3a:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
1a2f  24d4a3f:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
1a34  24d4a44:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
1a39  24d4a49:	44 03 64 24 14       	add    0x14(%rsp),%r12d
1a3e  24d4a4e:	84 c0                	test   %al,%al
1a40  24d4a50:	75 3c                	jne    24d4a8e <skl_check_plane_surface+0x1a7e>
1a42  24d4a52:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
1a47  24d4a57:	44 0f af e3          	imul   %ebx,%r12d
1a4b  24d4a5b:	44 2b 6c 24 28       	sub    0x28(%rsp),%r13d
1a50  24d4a60:	8b 28                	mov    (%rax),%ebp
1a52  24d4a62:	41 39 ec             	cmp    %ebp,%r12d
1a55  24d4a65:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
1a5d  24d4a6d:	0f 87 63 ff ff ff    	ja     24d49d6 <skl_check_plane_surface+0x19c6>
1a63  24d4a73:	eb 34                	jmp    24d4aa9 <skl_check_plane_surface+0x1a99>
1a65  24d4a75:	48 8b 0c 24          	mov    (%rsp),%rcx
1a69  24d4a79:	80 e1 07             	and    $0x7,%cl
1a6c  24d4a7c:	80 c1 03             	add    $0x3,%cl
1a6f  24d4a7f:	38 c1                	cmp    %al,%cl
1a71  24d4a81:	7c 8e                	jl     24d4a11 <skl_check_plane_surface+0x1a01>
1a73  24d4a83:	48 8b 3c 24          	mov    (%rsp),%rdi
1a77  24d4a87:	e8 00 00 00 00       	call   24d4a8c <skl_check_plane_surface+0x1a7c>	24d4a88: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1a7c  24d4a8c:	eb 83                	jmp    24d4a11 <skl_check_plane_surface+0x1a01>
1a7e  24d4a8e:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
1a83  24d4a93:	80 e1 07             	and    $0x7,%cl
1a86  24d4a96:	80 c1 03             	add    $0x3,%cl
1a89  24d4a99:	38 c1                	cmp    %al,%cl
1a8b  24d4a9b:	7c b5                	jl     24d4a52 <skl_check_plane_surface+0x1a42>
1a8d  24d4a9d:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
1a92  24d4aa2:	e8 00 00 00 00       	call   24d4aa7 <skl_check_plane_surface+0x1a97>	24d4aa3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1a97  24d4aa7:	eb a9                	jmp    24d4a52 <skl_check_plane_surface+0x1a42>
1a99  24d4aa9:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
1aa1  24d4ab1:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
1aab  24d4abb:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
1ab0  24d4ac0:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
1ab4  24d4ac4:	74 08                	je     24d4ace <skl_check_plane_surface+0x1abe>
1ab6  24d4ac6:	48 89 df             	mov    %rbx,%rdi
1ab9  24d4ac9:	e8 00 00 00 00       	call   24d4ace <skl_check_plane_surface+0x1abe>	24d4aca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1abe  24d4ace:	48 8b 03             	mov    (%rbx),%rax
1ac1  24d4ad1:	48 b9 04 00 00 00 00 00 00 01 	movabs $0x100000000000004,%rcx
1acb  24d4adb:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
1acf  24d4adf:	48 39 c8             	cmp    %rcx,%rax
1ad2  24d4ae2:	0f 85 47 01 00 00    	jne    24d4c2f <skl_check_plane_surface+0x1c1f>
1ad8  24d4ae8:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
1add  24d4aed:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
1ae1  24d4af1:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1ae6  24d4af6:	44 89 e9             	mov    %r13d,%ecx
1ae9  24d4af9:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
1aee  24d4afe:	44 89 e6             	mov    %r12d,%esi
1af1  24d4b01:	89 da                	mov    %ebx,%edx
1af3  24d4b03:	e8 b8 af 04 00       	call   251fac0 <skl_check_main_ccs_coordinates>
1af8  24d4b08:	45 85 ed             	test   %r13d,%r13d
1afb  24d4b0b:	0f 84 42 02 00 00    	je     24d4d53 <skl_check_plane_surface+0x1d43>
1b01  24d4b11:	84 c0                	test   %al,%al
1b03  24d4b13:	0f 85 3a 02 00 00    	jne    24d4d53 <skl_check_plane_surface+0x1d43>
1b09  24d4b19:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
1b0e  24d4b1e:	41 f7 de             	neg    %r14d
1b11  24d4b21:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
1b19  24d4b29:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
1b21  24d4b31:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
1b25  24d4b35:	74 08                	je     24d4b3f <skl_check_plane_surface+0x1b2f>
1b27  24d4b37:	48 89 df             	mov    %rbx,%rdi
1b2a  24d4b3a:	e8 00 00 00 00       	call   24d4b3f <skl_check_plane_surface+0x1b2f>	24d4b3b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1b2f  24d4b3f:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1b34  24d4b44:	48 8b 13             	mov    (%rbx),%rdx
1b37  24d4b47:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
1b3c  24d4b4c:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1b40  24d4b50:	84 c0                	test   %al,%al
1b42  24d4b52:	0f 85 83 00 00 00    	jne    24d4bdb <skl_check_plane_surface+0x1bcb>
1b48  24d4b58:	48 8b 04 24          	mov    (%rsp),%rax
1b4c  24d4b5c:	44 8b 00             	mov    (%rax),%r8d
1b4f  24d4b5f:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
1b54  24d4b64:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1b58  24d4b68:	84 c0                	test   %al,%al
1b5a  24d4b6a:	0f 85 91 00 00 00    	jne    24d4c01 <skl_check_plane_surface+0x1bf1>
1b60  24d4b70:	45 89 ef             	mov    %r13d,%r15d
1b63  24d4b73:	45 8b 8c 24 f4 00 00 00 	mov    0xf4(%r12),%r9d
1b6b  24d4b7b:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
1b6f  24d4b7f:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
1b74  24d4b84:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
1b79  24d4b89:	31 c9                	xor    %ecx,%ecx
1b7b  24d4b8b:	44 2b 7c 24 28       	sub    0x28(%rsp),%r15d
1b80  24d4b90:	55                   	push   %rbp
1b81  24d4b91:	41 55                	push   %r13
1b83  24d4b93:	e8 98 99 04 00       	call   251e530 <intel_adjust_aligned_offset>
1b88  24d4b98:	48 83 c4 10          	add    $0x10,%rsp
1b8c  24d4b9c:	4c 89 e7             	mov    %r12,%rdi
1b8f  24d4b9f:	44 8b 64 24 0c       	mov    0xc(%rsp),%r12d
1b94  24d4ba4:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
1b98  24d4ba8:	89 e9                	mov    %ebp,%ecx
1b9a  24d4baa:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
1b9f  24d4baf:	44 89 e6             	mov    %r12d,%esi
1ba2  24d4bb2:	89 da                	mov    %ebx,%edx
1ba4  24d4bb4:	e8 07 af 04 00       	call   251fac0 <skl_check_main_ccs_coordinates>
1ba9  24d4bb9:	85 ed                	test   %ebp,%ebp
1bab  24d4bbb:	0f 84 d3 01 00 00    	je     24d4d94 <skl_check_plane_surface+0x1d84>
1bb1  24d4bc1:	84 c0                	test   %al,%al
1bb3  24d4bc3:	45 89 fd             	mov    %r15d,%r13d
1bb6  24d4bc6:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
1bc0  24d4bd0:	0f 84 4b ff ff ff    	je     24d4b21 <skl_check_plane_surface+0x1b11>
1bc6  24d4bd6:	e9 c3 01 00 00       	jmp    24d4d9e <skl_check_plane_surface+0x1d8e>
1bcb  24d4bdb:	48 8b 0c 24          	mov    (%rsp),%rcx
1bcf  24d4bdf:	80 e1 07             	and    $0x7,%cl
1bd2  24d4be2:	80 c1 03             	add    $0x3,%cl
1bd5  24d4be5:	38 c1                	cmp    %al,%cl
1bd7  24d4be7:	0f 8c 6b ff ff ff    	jl     24d4b58 <skl_check_plane_surface+0x1b48>
1bdd  24d4bed:	48 8b 3c 24          	mov    (%rsp),%rdi
1be1  24d4bf1:	48 89 d3             	mov    %rdx,%rbx
1be4  24d4bf4:	e8 00 00 00 00       	call   24d4bf9 <skl_check_plane_surface+0x1be9>	24d4bf5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1be9  24d4bf9:	48 89 da             	mov    %rbx,%rdx
1bec  24d4bfc:	e9 57 ff ff ff       	jmp    24d4b58 <skl_check_plane_surface+0x1b48>
1bf1  24d4c01:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
1bf6  24d4c06:	80 e1 07             	and    $0x7,%cl
1bf9  24d4c09:	80 c1 03             	add    $0x3,%cl
1bfc  24d4c0c:	38 c1                	cmp    %al,%cl
1bfe  24d4c0e:	0f 8c 5c ff ff ff    	jl     24d4b70 <skl_check_plane_surface+0x1b60>
1c04  24d4c14:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
1c09  24d4c19:	48 89 d3             	mov    %rdx,%rbx
1c0c  24d4c1c:	44 89 c5             	mov    %r8d,%ebp
1c0f  24d4c1f:	e8 00 00 00 00       	call   24d4c24 <skl_check_plane_surface+0x1c14>	24d4c20: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c14  24d4c24:	41 89 e8             	mov    %ebp,%r8d
1c17  24d4c27:	48 89 da             	mov    %rbx,%rdx
1c1a  24d4c2a:	e9 41 ff ff ff       	jmp    24d4b70 <skl_check_plane_surface+0x1b60>
1c1f  24d4c2f:	45 89 ef             	mov    %r13d,%r15d
1c22  24d4c32:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
1c27  24d4c37:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
1c2c  24d4c3c:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
1c31  24d4c41:	49 81 c4 f0 00 00 00 	add    $0xf0,%r12
1c38  24d4c48:	4c 89 e0             	mov    %r12,%rax
1c3b  24d4c4b:	48 c1 e8 03          	shr    $0x3,%rax
1c3f  24d4c4f:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1c43  24d4c53:	84 c0                	test   %al,%al
1c45  24d4c55:	0f 85 c6 07 00 00    	jne    24d5421 <skl_check_plane_surface+0x2411>
1c4b  24d4c5b:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
1c53  24d4c63:	45 89 3c 24          	mov    %r15d,(%r12)
1c57  24d4c67:	49 89 ec             	mov    %rbp,%r12
1c5a  24d4c6a:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
1c5e  24d4c6e:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1c62  24d4c72:	84 c0                	test   %al,%al
1c64  24d4c74:	0f 85 cf 07 00 00    	jne    24d5449 <skl_check_plane_surface+0x2439>
1c6a  24d4c7a:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
1c72  24d4c82:	4c 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%r14
1c7a  24d4c8a:	89 18                	mov    %ebx,(%rax)
1c7c  24d4c8c:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
1c84  24d4c94:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
1c88  24d4c98:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1c8d  24d4c9d:	84 c0                	test   %al,%al
1c8f  24d4c9f:	0f 85 d6 07 00 00    	jne    24d547b <skl_check_plane_surface+0x246b>
1c95  24d4ca5:	41 89 2e             	mov    %ebp,(%r14)
1c98  24d4ca8:	c1 e3 10             	shl    $0x10,%ebx
1c9b  24d4cab:	42 0f b6 04 21       	movzbl (%rcx,%r12,1),%eax
1ca0  24d4cb0:	84 c0                	test   %al,%al
1ca2  24d4cb2:	0f 85 eb 07 00 00    	jne    24d54a3 <skl_check_plane_surface+0x2493>
1ca8  24d4cb8:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
1cb0  24d4cc0:	41 89 de             	mov    %ebx,%r14d
1cb3  24d4cc3:	c1 e5 10             	shl    $0x10,%ebp
1cb6  24d4cc6:	45 2b 75 00          	sub    0x0(%r13),%r14d
1cba  24d4cca:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1cbf  24d4ccf:	84 c0                	test   %al,%al
1cc1  24d4cd1:	0f 85 f4 07 00 00    	jne    24d54cb <skl_check_plane_surface+0x24bb>
1cc7  24d4cd7:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
1ccc  24d4cdc:	41 89 ef             	mov    %ebp,%r15d
1ccf  24d4cdf:	44 2b 38             	sub    (%rax),%r15d
1cd2  24d4ce2:	42 0f b6 04 21       	movzbl (%rcx,%r12,1),%eax
1cd7  24d4ce7:	84 c0                	test   %al,%al
1cd9  24d4ce9:	0f 85 08 08 00 00    	jne    24d54f7 <skl_check_plane_surface+0x24e7>
1cdf  24d4cef:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
1ce7  24d4cf7:	41 89 5d 00          	mov    %ebx,0x0(%r13)
1ceb  24d4cfb:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1cf0  24d4d00:	84 c0                	test   %al,%al
1cf2  24d4d02:	0f 85 0d 08 00 00    	jne    24d5515 <skl_check_plane_surface+0x2505>
1cf8  24d4d08:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
1cfd  24d4d0d:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
1d05  24d4d15:	89 28                	mov    %ebp,(%rax)
1d07  24d4d17:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
1d0f  24d4d1f:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1d14  24d4d24:	84 c0                	test   %al,%al
1d16  24d4d26:	0f 85 0b 08 00 00    	jne    24d5537 <skl_check_plane_surface+0x2527>
1d1c  24d4d2c:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
1d24  24d4d34:	44 01 33             	add    %r14d,(%rbx)
1d27  24d4d37:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1d2c  24d4d3c:	84 c0                	test   %al,%al
1d2e  24d4d3e:	0f 85 10 08 00 00    	jne    24d5554 <skl_check_plane_surface+0x2544>
1d34  24d4d44:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
1d39  24d4d49:	44 01 38             	add    %r15d,(%rax)
1d3c  24d4d4c:	31 c0                	xor    %eax,%eax
1d3e  24d4d4e:	e9 64 0c 00 00       	jmp    24d59b7 <skl_check_plane_surface+0x29a7>
1d43  24d4d53:	45 89 ef             	mov    %r13d,%r15d
1d46  24d4d56:	eb 46                	jmp    24d4d9e <skl_check_plane_surface+0x1d8e>
1d48  24d4d58:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
1d4d  24d4d5d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d57  24d4d67:	48 83 c3 18          	add    $0x18,%rbx
1d5b  24d4d6b:	48 89 d8             	mov    %rbx,%rax
1d5e  24d4d6e:	48 c1 e8 03          	shr    $0x3,%rax
1d62  24d4d72:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1d66  24d4d76:	74 08                	je     24d4d80 <skl_check_plane_surface+0x1d70>
1d68  24d4d78:	48 89 df             	mov    %rbx,%rdi
1d6b  24d4d7b:	e8 00 00 00 00       	call   24d4d80 <skl_check_plane_surface+0x1d70>	24d4d7c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d70  24d4d80:	48 8b 3b             	mov    (%rbx),%rdi
1d73  24d4d83:	be 04 00 00 00       	mov    $0x4,%esi
1d78  24d4d88:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	24d4d8b: R_X86_64_32S	.rodata+0x9e2fa0
1d7f  24d4d8f:	e9 19 0c 00 00       	jmp    24d59ad <skl_check_plane_surface+0x299d>
1d84  24d4d94:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
1d8e  24d4d9e:	80 bc 24 a8 00 00 00 00 	cmpb   $0x0,0xa8(%rsp)
1d96  24d4da6:	0f 84 d4 0a 00 00    	je     24d5880 <skl_check_plane_surface+0x2870>
1d9c  24d4dac:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
1da1  24d4db1:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
1da6  24d4db6:	c1 e0 04             	shl    $0x4,%eax
1da9  24d4db9:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
1dae  24d4dbe:	4c 8d b4 01 f8 00 00 00 	lea    0xf8(%rcx,%rax,1),%r14
1db6  24d4dc6:	4c 89 f0             	mov    %r14,%rax
1db9  24d4dc9:	48 c1 e8 03          	shr    $0x3,%rax
1dbd  24d4dcd:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1dc1  24d4dd1:	84 c0                	test   %al,%al
1dc3  24d4dd3:	0f 85 91 08 00 00    	jne    24d566a <skl_check_plane_surface+0x265a>
1dc9  24d4dd9:	45 3b 26             	cmp    (%r14),%r12d
1dcc  24d4ddc:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
1dd1  24d4de1:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
1dd6  24d4de6:	75 2c                	jne    24d4e14 <skl_check_plane_surface+0x1e04>
1dd8  24d4de8:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
1ddd  24d4ded:	c1 e0 04             	shl    $0x4,%eax
1de0  24d4df0:	4d 8d b4 04 fc 00 00 00 	lea    0xfc(%r12,%rax,1),%r14
1de8  24d4df8:	4c 89 f0             	mov    %r14,%rax
1deb  24d4dfb:	48 c1 e8 03          	shr    $0x3,%rax
1def  24d4dff:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
1df3  24d4e03:	84 c0                	test   %al,%al
1df5  24d4e05:	0f 85 45 09 00 00    	jne    24d5750 <skl_check_plane_surface+0x2740>
1dfb  24d4e0b:	41 3b 1e             	cmp    (%r14),%ebx
1dfe  24d4e0e:	0f 84 2d fe ff ff    	je     24d4c41 <skl_check_plane_surface+0x1c31>
1e04  24d4e14:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
1e09  24d4e19:	48 83 c3 18          	add    $0x18,%rbx
1e0d  24d4e1d:	48 89 d8             	mov    %rbx,%rax
1e10  24d4e20:	48 c1 e8 03          	shr    $0x3,%rax
1e14  24d4e24:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
1e18  24d4e28:	0f 84 70 0b 00 00    	je     24d599e <skl_check_plane_surface+0x298e>
1e1e  24d4e2e:	48 89 df             	mov    %rbx,%rdi
1e21  24d4e31:	e8 00 00 00 00       	call   24d4e36 <skl_check_plane_surface+0x1e26>	24d4e32: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e26  24d4e36:	e9 63 0b 00 00       	jmp    24d599e <skl_check_plane_surface+0x298e>
1e2b  24d4e3b:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
1e30  24d4e40:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e3a  24d4e4a:	49 83 c6 18          	add    $0x18,%r14
1e3e  24d4e4e:	4d 89 f7             	mov    %r14,%r15
1e41  24d4e51:	49 c1 ee 03          	shr    $0x3,%r14
1e45  24d4e55:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
1e4a  24d4e5a:	74 08                	je     24d4e64 <skl_check_plane_surface+0x1e54>
1e4c  24d4e5c:	4c 89 ff             	mov    %r15,%rdi
1e4f  24d4e5f:	e8 00 00 00 00       	call   24d4e64 <skl_check_plane_surface+0x1e54>	24d4e60: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e54  24d4e64:	49 8b 3f             	mov    (%r15),%rdi
1e57  24d4e67:	e8 00 00 00 00       	call   24d4e6c <skl_check_plane_surface+0x1e5c>	24d4e68: R_X86_64_PLT32	dev_driver_string-0x4
1e5c  24d4e6c:	48 89 c3             	mov    %rax,%rbx
1e5f  24d4e6f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e69  24d4e79:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
1e6e  24d4e7e:	74 08                	je     24d4e88 <skl_check_plane_surface+0x1e78>
1e70  24d4e80:	4c 89 ff             	mov    %r15,%rdi
1e73  24d4e83:	e8 00 00 00 00       	call   24d4e88 <skl_check_plane_surface+0x1e78>	24d4e84: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e78  24d4e88:	4d 8b 37             	mov    (%r15),%r14
1e7b  24d4e8b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1e85  24d4e95:	4d 8d 7e 70          	lea    0x70(%r14),%r15
1e89  24d4e99:	4c 89 f8             	mov    %r15,%rax
1e8c  24d4e9c:	48 c1 e8 03          	shr    $0x3,%rax
1e90  24d4ea0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1e94  24d4ea4:	74 08                	je     24d4eae <skl_check_plane_surface+0x1e9e>
1e96  24d4ea6:	4c 89 ff             	mov    %r15,%rdi
1e99  24d4ea9:	e8 00 00 00 00       	call   24d4eae <skl_check_plane_surface+0x1e9e>	24d4eaa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e9e  24d4eae:	49 8b 17             	mov    (%r15),%rdx
1ea1  24d4eb1:	48 85 d2             	test   %rdx,%rdx
1ea4  24d4eb4:	75 22                	jne    24d4ed8 <skl_check_plane_surface+0x1ec8>
1ea6  24d4eb6:	4c 89 f0             	mov    %r14,%rax
1ea9  24d4eb9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1eb3  24d4ec3:	48 c1 e8 03          	shr    $0x3,%rax
1eb7  24d4ec7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1ebb  24d4ecb:	74 08                	je     24d4ed5 <skl_check_plane_surface+0x1ec5>
1ebd  24d4ecd:	4c 89 f7             	mov    %r14,%rdi
1ec0  24d4ed0:	e8 00 00 00 00       	call   24d4ed5 <skl_check_plane_surface+0x1ec5>	24d4ed1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1ec5  24d4ed5:	49 8b 16             	mov    (%r14),%rdx
1ec8  24d4ed8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d4edb: R_X86_64_32S	.rodata+0x9de4c0
1ecf  24d4edf:	48 89 de             	mov    %rbx,%rsi
1ed2  24d4ee2:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	24d4ee5: R_X86_64_32S	.rodata+0x9e0d80
1ed9  24d4ee9:	e8 00 00 00 00       	call   24d4eee <skl_check_plane_surface+0x1ede>	24d4eea: R_X86_64_PLT32	__warn_printk-0x4
1ede  24d4eee:	0f 0b                	ud2
1ee0  24d4ef0:	e9 bd 0a 00 00       	jmp    24d59b2 <skl_check_plane_surface+0x29a2>
1ee5  24d4ef5:	4c 8b 74 24 70       	mov    0x70(%rsp),%r14
1eea  24d4efa:	49 c1 ee 03          	shr    $0x3,%r14
1eee  24d4efe:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
1ef3  24d4f03:	74 0a                	je     24d4f0f <skl_check_plane_surface+0x1eff>
1ef5  24d4f05:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1efa  24d4f0a:	e8 00 00 00 00       	call   24d4f0f <skl_check_plane_surface+0x1eff>	24d4f0b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1eff  24d4f0f:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
1f04  24d4f14:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f0e  24d4f1e:	48 8b 18             	mov    (%rax),%rbx
1f11  24d4f21:	48 83 c3 18          	add    $0x18,%rbx
1f15  24d4f25:	48 89 d8             	mov    %rbx,%rax
1f18  24d4f28:	48 c1 e8 03          	shr    $0x3,%rax
1f1c  24d4f2c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1f20  24d4f30:	74 08                	je     24d4f3a <skl_check_plane_surface+0x1f2a>
1f22  24d4f32:	48 89 df             	mov    %rbx,%rdi
1f25  24d4f35:	e8 00 00 00 00       	call   24d4f3a <skl_check_plane_surface+0x1f2a>	24d4f36: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f2a  24d4f3a:	48 8b 3b             	mov    (%rbx),%rdi
1f2d  24d4f3d:	e8 00 00 00 00       	call   24d4f42 <skl_check_plane_surface+0x1f32>	24d4f3e: R_X86_64_PLT32	dev_driver_string-0x4
1f32  24d4f42:	48 89 c3             	mov    %rax,%rbx
1f35  24d4f45:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1f3f  24d4f4f:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
1f44  24d4f54:	74 0a                	je     24d4f60 <skl_check_plane_surface+0x1f50>
1f46  24d4f56:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1f4b  24d4f5b:	e8 00 00 00 00       	call   24d4f60 <skl_check_plane_surface+0x1f50>	24d4f5c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f50  24d4f60:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
1f55  24d4f65:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f5f  24d4f6f:	4c 8b 30             	mov    (%rax),%r14
1f62  24d4f72:	49 83 c6 18          	add    $0x18,%r14
1f66  24d4f76:	4c 89 f0             	mov    %r14,%rax
1f69  24d4f79:	48 c1 e8 03          	shr    $0x3,%rax
1f6d  24d4f7d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1f71  24d4f81:	74 08                	je     24d4f8b <skl_check_plane_surface+0x1f7b>
1f73  24d4f83:	4c 89 f7             	mov    %r14,%rdi
1f76  24d4f86:	e8 00 00 00 00       	call   24d4f8b <skl_check_plane_surface+0x1f7b>	24d4f87: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f7b  24d4f8b:	4d 8b 36             	mov    (%r14),%r14
1f7e  24d4f8e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f88  24d4f98:	4d 8d 7e 70          	lea    0x70(%r14),%r15
1f8c  24d4f9c:	4c 89 f8             	mov    %r15,%rax
1f8f  24d4f9f:	48 c1 e8 03          	shr    $0x3,%rax
1f93  24d4fa3:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1f97  24d4fa7:	74 08                	je     24d4fb1 <skl_check_plane_surface+0x1fa1>
1f99  24d4fa9:	4c 89 ff             	mov    %r15,%rdi
1f9c  24d4fac:	e8 00 00 00 00       	call   24d4fb1 <skl_check_plane_surface+0x1fa1>	24d4fad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1fa1  24d4fb1:	49 8b 17             	mov    (%r15),%rdx
1fa4  24d4fb4:	48 85 d2             	test   %rdx,%rdx
1fa7  24d4fb7:	75 22                	jne    24d4fdb <skl_check_plane_surface+0x1fcb>
1fa9  24d4fb9:	4c 89 f0             	mov    %r14,%rax
1fac  24d4fbc:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1fb6  24d4fc6:	48 c1 e8 03          	shr    $0x3,%rax
1fba  24d4fca:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1fbe  24d4fce:	74 08                	je     24d4fd8 <skl_check_plane_surface+0x1fc8>
1fc0  24d4fd0:	4c 89 f7             	mov    %r14,%rdi
1fc3  24d4fd3:	e8 00 00 00 00       	call   24d4fd8 <skl_check_plane_surface+0x1fc8>	24d4fd4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1fc8  24d4fd8:	49 8b 16             	mov    (%r14),%rdx
1fcb  24d4fdb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d4fde: R_X86_64_32S	.rodata+0x9de4c0
1fd2  24d4fe2:	48 89 de             	mov    %rbx,%rsi
1fd5  24d4fe5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	24d4fe8: R_X86_64_32S	.rodata+0x9e27e0
1fdc  24d4fec:	e8 00 00 00 00       	call   24d4ff1 <skl_check_plane_surface+0x1fe1>	24d4fed: R_X86_64_PLT32	__warn_printk-0x4
1fe1  24d4ff1:	0f 0b                	ud2
1fe3  24d4ff3:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
1fe8  24d4ff8:	4c 8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%r14
1ff0  24d5000:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
1ffa  24d500a:	e9 29 eb ff ff       	jmp    24d3b38 <skl_check_plane_surface+0xb28>
1fff  24d500f:	89 d9                	mov    %ebx,%ecx
2001  24d5011:	80 e1 07             	and    $0x7,%cl
2004  24d5014:	38 c1                	cmp    %al,%cl
2006  24d5016:	0f 8c 67 e0 ff ff    	jl     24d3083 <skl_check_plane_surface+0x73>
200c  24d501c:	48 89 df             	mov    %rbx,%rdi
200f  24d501f:	e8 00 00 00 00       	call   24d5024 <skl_check_plane_surface+0x2014>	24d5020: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2014  24d5024:	e9 5a e0 ff ff       	jmp    24d3083 <skl_check_plane_surface+0x73>
2019  24d5029:	44 89 f1             	mov    %r14d,%ecx
201c  24d502c:	80 e1 07             	and    $0x7,%cl
201f  24d502f:	38 c1                	cmp    %al,%cl
2021  24d5031:	0f 8c 01 e6 ff ff    	jl     24d3638 <skl_check_plane_surface+0x628>
2027  24d5037:	4c 89 f7             	mov    %r14,%rdi
202a  24d503a:	e8 00 00 00 00       	call   24d503f <skl_check_plane_surface+0x202f>	24d503b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
202f  24d503f:	e9 f4 e5 ff ff       	jmp    24d3638 <skl_check_plane_surface+0x628>
2034  24d5044:	89 d9                	mov    %ebx,%ecx
2036  24d5046:	80 e1 07             	and    $0x7,%cl
2039  24d5049:	38 c1                	cmp    %al,%cl
203b  24d504b:	0f 8c 9f ee ff ff    	jl     24d3ef0 <skl_check_plane_surface+0xee0>
2041  24d5051:	48 89 df             	mov    %rbx,%rdi
2044  24d5054:	e8 00 00 00 00       	call   24d5059 <skl_check_plane_surface+0x2049>	24d5055: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2049  24d5059:	e9 92 ee ff ff       	jmp    24d3ef0 <skl_check_plane_surface+0xee0>
204e  24d505e:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
2053  24d5063:	80 e1 07             	and    $0x7,%cl
2056  24d5066:	80 c1 03             	add    $0x3,%cl
2059  24d5069:	38 c1                	cmp    %al,%cl
205b  24d506b:	0f 8c be ef ff ff    	jl     24d402f <skl_check_plane_surface+0x101f>
2061  24d5071:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
2066  24d5076:	e8 00 00 00 00       	call   24d507b <skl_check_plane_surface+0x206b>	24d5077: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
206b  24d507b:	e9 af ef ff ff       	jmp    24d402f <skl_check_plane_surface+0x101f>
2070  24d5080:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
2075  24d5085:	80 e1 07             	and    $0x7,%cl
2078  24d5088:	80 c1 03             	add    $0x3,%cl
207b  24d508b:	38 c1                	cmp    %al,%cl
207d  24d508d:	0f 8c c6 ef ff ff    	jl     24d4059 <skl_check_plane_surface+0x1049>
2083  24d5093:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
2088  24d5098:	e8 00 00 00 00       	call   24d509d <skl_check_plane_surface+0x208d>	24d5099: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
208d  24d509d:	e9 b7 ef ff ff       	jmp    24d4059 <skl_check_plane_surface+0x1049>
2092  24d50a2:	89 d9                	mov    %ebx,%ecx
2094  24d50a4:	80 e1 07             	and    $0x7,%cl
2097  24d50a7:	80 c1 03             	add    $0x3,%cl
209a  24d50aa:	38 c1                	cmp    %al,%cl
209c  24d50ac:	0f 8c da ef ff ff    	jl     24d408c <skl_check_plane_surface+0x107c>
20a2  24d50b2:	48 89 df             	mov    %rbx,%rdi
20a5  24d50b5:	e8 00 00 00 00       	call   24d50ba <skl_check_plane_surface+0x20aa>	24d50b6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20aa  24d50ba:	e9 cd ef ff ff       	jmp    24d408c <skl_check_plane_surface+0x107c>
20af  24d50bf:	44 89 f1             	mov    %r14d,%ecx
20b2  24d50c2:	80 e1 07             	and    $0x7,%cl
20b5  24d50c5:	80 c1 03             	add    $0x3,%cl
20b8  24d50c8:	38 c1                	cmp    %al,%cl
20ba  24d50ca:	0f 8c e4 ef ff ff    	jl     24d40b4 <skl_check_plane_surface+0x10a4>
20c0  24d50d0:	4c 89 f7             	mov    %r14,%rdi
20c3  24d50d3:	e8 00 00 00 00       	call   24d50d8 <skl_check_plane_surface+0x20c8>	24d50d4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20c8  24d50d8:	45 89 f9             	mov    %r15d,%r9d
20cb  24d50db:	e9 d4 ef ff ff       	jmp    24d40b4 <skl_check_plane_surface+0x10a4>
20d0  24d50e0:	89 d9                	mov    %ebx,%ecx
20d2  24d50e2:	80 e1 07             	and    $0x7,%cl
20d5  24d50e5:	80 c1 03             	add    $0x3,%cl
20d8  24d50e8:	38 c1                	cmp    %al,%cl
20da  24d50ea:	0f 8c a2 f0 ff ff    	jl     24d4192 <skl_check_plane_surface+0x1182>
20e0  24d50f0:	48 89 df             	mov    %rbx,%rdi
20e3  24d50f3:	e8 00 00 00 00       	call   24d50f8 <skl_check_plane_surface+0x20e8>	24d50f4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20e8  24d50f8:	44 8b 04 24          	mov    (%rsp),%r8d
20ec  24d50fc:	45 89 f9             	mov    %r15d,%r9d
20ef  24d50ff:	e9 8e f0 ff ff       	jmp    24d4192 <skl_check_plane_surface+0x1182>
20f4  24d5104:	44 89 e1             	mov    %r12d,%ecx
20f7  24d5107:	80 e1 07             	and    $0x7,%cl
20fa  24d510a:	38 c1                	cmp    %al,%cl
20fc  24d510c:	0f 8c a4 f0 ff ff    	jl     24d41b6 <skl_check_plane_surface+0x11a6>
2102  24d5112:	4c 89 e7             	mov    %r12,%rdi
2105  24d5115:	e8 00 00 00 00       	call   24d511a <skl_check_plane_surface+0x210a>	24d5116: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
210a  24d511a:	44 8b 04 24          	mov    (%rsp),%r8d
210e  24d511e:	45 89 f9             	mov    %r15d,%r9d
2111  24d5121:	e9 90 f0 ff ff       	jmp    24d41b6 <skl_check_plane_surface+0x11a6>
2116  24d5126:	44 89 e1             	mov    %r12d,%ecx
2119  24d5129:	80 e1 07             	and    $0x7,%cl
211c  24d512c:	38 c1                	cmp    %al,%cl
211e  24d512e:	0f 8c e1 f4 ff ff    	jl     24d4615 <skl_check_plane_surface+0x1605>
2124  24d5134:	4c 89 e7             	mov    %r12,%rdi
2127  24d5137:	44 89 04 24          	mov    %r8d,(%rsp)
212b  24d513b:	e8 00 00 00 00       	call   24d5140 <skl_check_plane_surface+0x2130>	24d513c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2130  24d5140:	44 8b 04 24          	mov    (%rsp),%r8d
2134  24d5144:	44 8b 4c 24 14       	mov    0x14(%rsp),%r9d
2139  24d5149:	e9 c7 f4 ff ff       	jmp    24d4615 <skl_check_plane_surface+0x1605>
213e  24d514e:	89 d9                	mov    %ebx,%ecx
2140  24d5150:	80 e1 07             	and    $0x7,%cl
2143  24d5153:	38 c1                	cmp    %al,%cl
2145  24d5155:	0f 8c 1c e5 ff ff    	jl     24d3677 <skl_check_plane_surface+0x667>
214b  24d515b:	48 89 df             	mov    %rbx,%rdi
214e  24d515e:	e8 00 00 00 00       	call   24d5163 <skl_check_plane_surface+0x2153>	24d515f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2153  24d5163:	e9 0f e5 ff ff       	jmp    24d3677 <skl_check_plane_surface+0x667>
2158  24d5168:	89 f9                	mov    %edi,%ecx
215a  24d516a:	80 e1 07             	and    $0x7,%cl
215d  24d516d:	80 c1 03             	add    $0x3,%cl
2160  24d5170:	38 c1                	cmp    %al,%cl
2162  24d5172:	0f 8c b7 df ff ff    	jl     24d312f <skl_check_plane_surface+0x11f>
2168  24d5178:	e8 00 00 00 00       	call   24d517d <skl_check_plane_surface+0x216d>	24d5179: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
216d  24d517d:	e9 ad df ff ff       	jmp    24d312f <skl_check_plane_surface+0x11f>
2172  24d5182:	89 d9                	mov    %ebx,%ecx
2174  24d5184:	80 e1 07             	and    $0x7,%cl
2177  24d5187:	80 c1 03             	add    $0x3,%cl
217a  24d518a:	38 c1                	cmp    %al,%cl
217c  24d518c:	0f 8c bf df ff ff    	jl     24d3151 <skl_check_plane_surface+0x141>
2182  24d5192:	48 89 df             	mov    %rbx,%rdi
2185  24d5195:	e8 00 00 00 00       	call   24d519a <skl_check_plane_surface+0x218a>	24d5196: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
218a  24d519a:	e9 b2 df ff ff       	jmp    24d3151 <skl_check_plane_surface+0x141>
218f  24d519f:	89 d9                	mov    %ebx,%ecx
2191  24d51a1:	80 e1 07             	and    $0x7,%cl
2194  24d51a4:	38 c1                	cmp    %al,%cl
2196  24d51a6:	0f 8c ef df ff ff    	jl     24d319b <skl_check_plane_surface+0x18b>
219c  24d51ac:	48 89 df             	mov    %rbx,%rdi
219f  24d51af:	e8 00 00 00 00       	call   24d51b4 <skl_check_plane_surface+0x21a4>	24d51b0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
21a4  24d51b4:	e9 e2 df ff ff       	jmp    24d319b <skl_check_plane_surface+0x18b>
21a9  24d51b9:	89 d9                	mov    %ebx,%ecx
21ab  24d51bb:	80 e1 07             	and    $0x7,%cl
21ae  24d51be:	38 c1                	cmp    %al,%cl
21b0  24d51c0:	0f 8c 7e ef ff ff    	jl     24d4144 <skl_check_plane_surface+0x1134>
21b6  24d51c6:	48 89 df             	mov    %rbx,%rdi
21b9  24d51c9:	e8 00 00 00 00       	call   24d51ce <skl_check_plane_surface+0x21be>	24d51ca: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
21be  24d51ce:	e9 71 ef ff ff       	jmp    24d4144 <skl_check_plane_surface+0x1134>
21c3  24d51d3:	89 d9                	mov    %ebx,%ecx
21c5  24d51d5:	80 e1 07             	and    $0x7,%cl
21c8  24d51d8:	80 c1 03             	add    $0x3,%cl
21cb  24d51db:	38 c1                	cmp    %al,%cl
21cd  24d51dd:	0f 8c 3c f0 ff ff    	jl     24d421f <skl_check_plane_surface+0x120f>
21d3  24d51e3:	48 89 df             	mov    %rbx,%rdi
21d6  24d51e6:	45 89 ce             	mov    %r9d,%r14d
21d9  24d51e9:	e8 00 00 00 00       	call   24d51ee <skl_check_plane_surface+0x21de>	24d51ea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
21de  24d51ee:	44 8b 04 24          	mov    (%rsp),%r8d
21e2  24d51f2:	45 89 f1             	mov    %r14d,%r9d
21e5  24d51f5:	e9 25 f0 ff ff       	jmp    24d421f <skl_check_plane_surface+0x120f>
21ea  24d51fa:	89 d9                	mov    %ebx,%ecx
21ec  24d51fc:	80 e1 07             	and    $0x7,%cl
21ef  24d51ff:	80 c1 03             	add    $0x3,%cl
21f2  24d5202:	38 c1                	cmp    %al,%cl
21f4  24d5204:	0f 8c 6f f4 ff ff    	jl     24d4679 <skl_check_plane_surface+0x1669>
21fa  24d520a:	48 89 df             	mov    %rbx,%rdi
21fd  24d520d:	e8 00 00 00 00       	call   24d5212 <skl_check_plane_surface+0x2202>	24d520e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2202  24d5212:	e9 62 f4 ff ff       	jmp    24d4679 <skl_check_plane_surface+0x1669>
2207  24d5217:	44 89 f1             	mov    %r14d,%ecx
220a  24d521a:	80 e1 07             	and    $0x7,%cl
220d  24d521d:	80 c1 03             	add    $0x3,%cl
2210  24d5220:	38 c1                	cmp    %al,%cl
2212  24d5222:	0f 8c 85 f4 ff ff    	jl     24d46ad <skl_check_plane_surface+0x169d>
2218  24d5228:	4c 89 f7             	mov    %r14,%rdi
221b  24d522b:	e8 00 00 00 00       	call   24d5230 <skl_check_plane_surface+0x2220>	24d522c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2220  24d5230:	e9 78 f4 ff ff       	jmp    24d46ad <skl_check_plane_surface+0x169d>
2225  24d5235:	48 8b 0c 24          	mov    (%rsp),%rcx
2229  24d5239:	80 e1 07             	and    $0x7,%cl
222c  24d523c:	80 c1 03             	add    $0x3,%cl
222f  24d523f:	38 c1                	cmp    %al,%cl
2231  24d5241:	0f 8c f8 f4 ff ff    	jl     24d473f <skl_check_plane_surface+0x172f>
2237  24d5247:	48 8b 3c 24          	mov    (%rsp),%rdi
223b  24d524b:	e8 00 00 00 00       	call   24d5250 <skl_check_plane_surface+0x2240>	24d524c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2240  24d5250:	e9 ea f4 ff ff       	jmp    24d473f <skl_check_plane_surface+0x172f>
2245  24d5255:	44 89 e1             	mov    %r12d,%ecx
2248  24d5258:	80 e1 07             	and    $0x7,%cl
224b  24d525b:	80 c1 03             	add    $0x3,%cl
224e  24d525e:	38 c1                	cmp    %al,%cl
2250  24d5260:	0f 8c 00 f5 ff ff    	jl     24d4766 <skl_check_plane_surface+0x1756>
2256  24d5266:	4c 89 e7             	mov    %r12,%rdi
2259  24d5269:	4c 89 54 24 28       	mov    %r10,0x28(%rsp)
225e  24d526e:	e8 00 00 00 00       	call   24d5273 <skl_check_plane_surface+0x2263>	24d526f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2263  24d5273:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
2268  24d5278:	e9 e9 f4 ff ff       	jmp    24d4766 <skl_check_plane_surface+0x1756>
226d  24d527d:	44 89 f9             	mov    %r15d,%ecx
2270  24d5280:	80 e1 07             	and    $0x7,%cl
2273  24d5283:	80 c1 03             	add    $0x3,%cl
2276  24d5286:	38 c1                	cmp    %al,%cl
2278  24d5288:	0f 8c fb f4 ff ff    	jl     24d4789 <skl_check_plane_surface+0x1779>
227e  24d528e:	4c 89 ff             	mov    %r15,%rdi
2281  24d5291:	4c 89 d5             	mov    %r10,%rbp
2284  24d5294:	e8 00 00 00 00       	call   24d5299 <skl_check_plane_surface+0x2289>	24d5295: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2289  24d5299:	49 89 ea             	mov    %rbp,%r10
228c  24d529c:	e9 e8 f4 ff ff       	jmp    24d4789 <skl_check_plane_surface+0x1779>
2291  24d52a1:	89 d9                	mov    %ebx,%ecx
2293  24d52a3:	80 e1 07             	and    $0x7,%cl
2296  24d52a6:	38 c1                	cmp    %al,%cl
2298  24d52a8:	0f 8c 81 e4 ff ff    	jl     24d372f <skl_check_plane_surface+0x71f>
229e  24d52ae:	48 89 df             	mov    %rbx,%rdi
22a1  24d52b1:	e8 00 00 00 00       	call   24d52b6 <skl_check_plane_surface+0x22a6>	24d52b2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
22a6  24d52b6:	e9 74 e4 ff ff       	jmp    24d372f <skl_check_plane_surface+0x71f>
22ab  24d52bb:	89 f9                	mov    %edi,%ecx
22ad  24d52bd:	80 e1 07             	and    $0x7,%cl
22b0  24d52c0:	80 c1 03             	add    $0x3,%cl
22b3  24d52c3:	38 c1                	cmp    %al,%cl
22b5  24d52c5:	0f 8c 31 e5 ff ff    	jl     24d37fc <skl_check_plane_surface+0x7ec>
22bb  24d52cb:	e8 00 00 00 00       	call   24d52d0 <skl_check_plane_surface+0x22c0>	24d52cc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
22c0  24d52d0:	e9 27 e5 ff ff       	jmp    24d37fc <skl_check_plane_surface+0x7ec>
22c5  24d52d5:	89 f9                	mov    %edi,%ecx
22c7  24d52d7:	80 e1 07             	and    $0x7,%cl
22ca  24d52da:	80 c1 03             	add    $0x3,%cl
22cd  24d52dd:	38 c1                	cmp    %al,%cl
22cf  24d52df:	0f 8c 34 e5 ff ff    	jl     24d3819 <skl_check_plane_surface+0x809>
22d5  24d52e5:	e8 00 00 00 00       	call   24d52ea <skl_check_plane_surface+0x22da>	24d52e6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
22da  24d52ea:	e9 2a e5 ff ff       	jmp    24d3819 <skl_check_plane_surface+0x809>
22df  24d52ef:	89 f9                	mov    %edi,%ecx
22e1  24d52f1:	80 e1 07             	and    $0x7,%cl
22e4  24d52f4:	80 c1 03             	add    $0x3,%cl
22e7  24d52f7:	38 c1                	cmp    %al,%cl
22e9  24d52f9:	0f 8c 40 e5 ff ff    	jl     24d383f <skl_check_plane_surface+0x82f>
22ef  24d52ff:	e8 00 00 00 00       	call   24d5304 <skl_check_plane_surface+0x22f4>	24d5300: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
22f4  24d5304:	e9 36 e5 ff ff       	jmp    24d383f <skl_check_plane_surface+0x82f>
22f9  24d5309:	89 f9                	mov    %edi,%ecx
22fb  24d530b:	80 e1 07             	and    $0x7,%cl
22fe  24d530e:	80 c1 03             	add    $0x3,%cl
2301  24d5311:	38 c1                	cmp    %al,%cl
2303  24d5313:	0f 8c 43 e5 ff ff    	jl     24d385c <skl_check_plane_surface+0x84c>
2309  24d5319:	e8 00 00 00 00       	call   24d531e <skl_check_plane_surface+0x230e>	24d531a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
230e  24d531e:	e9 39 e5 ff ff       	jmp    24d385c <skl_check_plane_surface+0x84c>
2313  24d5323:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
2318  24d5328:	80 e1 07             	and    $0x7,%cl
231b  24d532b:	80 c1 03             	add    $0x3,%cl
231e  24d532e:	38 c1                	cmp    %al,%cl
2320  24d5330:	0f 8c 60 e5 ff ff    	jl     24d3896 <skl_check_plane_surface+0x886>
2326  24d5336:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
232b  24d533b:	e8 00 00 00 00       	call   24d5340 <skl_check_plane_surface+0x2330>	24d533c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2330  24d5340:	e9 51 e5 ff ff       	jmp    24d3896 <skl_check_plane_surface+0x886>
2335  24d5345:	89 d9                	mov    %ebx,%ecx
2337  24d5347:	80 e1 07             	and    $0x7,%cl
233a  24d534a:	80 c1 03             	add    $0x3,%cl
233d  24d534d:	38 c1                	cmp    %al,%cl
233f  24d534f:	0f 8c 76 e5 ff ff    	jl     24d38cb <skl_check_plane_surface+0x8bb>
2345  24d5355:	48 89 df             	mov    %rbx,%rdi
2348  24d5358:	e8 00 00 00 00       	call   24d535d <skl_check_plane_surface+0x234d>	24d5359: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
234d  24d535d:	e9 69 e5 ff ff       	jmp    24d38cb <skl_check_plane_surface+0x8bb>
2352  24d5362:	48 8b 0c 24          	mov    (%rsp),%rcx
2356  24d5366:	80 e1 07             	and    $0x7,%cl
2359  24d5369:	80 c1 03             	add    $0x3,%cl
235c  24d536c:	38 c1                	cmp    %al,%cl
235e  24d536e:	0f 8c 03 e6 ff ff    	jl     24d3977 <skl_check_plane_surface+0x967>
2364  24d5374:	48 8b 3c 24          	mov    (%rsp),%rdi
2368  24d5378:	4d 89 c4             	mov    %r8,%r12
236b  24d537b:	e8 00 00 00 00       	call   24d5380 <skl_check_plane_surface+0x2370>	24d537c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2370  24d5380:	4d 89 e0             	mov    %r12,%r8
2373  24d5383:	e9 ef e5 ff ff       	jmp    24d3977 <skl_check_plane_surface+0x967>
2378  24d5388:	44 89 e1             	mov    %r12d,%ecx
237b  24d538b:	80 e1 07             	and    $0x7,%cl
237e  24d538e:	80 c1 03             	add    $0x3,%cl
2381  24d5391:	38 c1                	cmp    %al,%cl
2383  24d5393:	0f 8c 0a e6 ff ff    	jl     24d39a3 <skl_check_plane_surface+0x993>
2389  24d5399:	4c 89 e7             	mov    %r12,%rdi
238c  24d539c:	4c 89 84 24 a0 00 00 00 	mov    %r8,0xa0(%rsp)
2394  24d53a4:	4c 89 94 24 d0 00 00 00 	mov    %r10,0xd0(%rsp)
239c  24d53ac:	e8 00 00 00 00       	call   24d53b1 <skl_check_plane_surface+0x23a1>	24d53ad: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
23a1  24d53b1:	4c 8b 94 24 d0 00 00 00 	mov    0xd0(%rsp),%r10
23a9  24d53b9:	4c 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%r8
23b1  24d53c1:	e9 dd e5 ff ff       	jmp    24d39a3 <skl_check_plane_surface+0x993>
23b6  24d53c6:	89 d9                	mov    %ebx,%ecx
23b8  24d53c8:	80 e1 07             	and    $0x7,%cl
23bb  24d53cb:	80 c1 03             	add    $0x3,%cl
23be  24d53ce:	38 c1                	cmp    %al,%cl
23c0  24d53d0:	0f 8c f1 e5 ff ff    	jl     24d39c7 <skl_check_plane_surface+0x9b7>
23c6  24d53d6:	48 89 df             	mov    %rbx,%rdi
23c9  24d53d9:	4c 89 84 24 a0 00 00 00 	mov    %r8,0xa0(%rsp)
23d1  24d53e1:	4d 89 d5             	mov    %r10,%r13
23d4  24d53e4:	44 89 4c 24 14       	mov    %r9d,0x14(%rsp)
23d9  24d53e9:	e8 00 00 00 00       	call   24d53ee <skl_check_plane_surface+0x23de>	24d53ea: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
23de  24d53ee:	44 8b 4c 24 14       	mov    0x14(%rsp),%r9d
23e3  24d53f3:	4c 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%r8
23eb  24d53fb:	4d 89 ea             	mov    %r13,%r10
23ee  24d53fe:	e9 c4 e5 ff ff       	jmp    24d39c7 <skl_check_plane_surface+0x9b7>
23f3  24d5403:	89 d9                	mov    %ebx,%ecx
23f5  24d5405:	80 e1 07             	and    $0x7,%cl
23f8  24d5408:	38 c1                	cmp    %al,%cl
23fa  24d540a:	0f 8c b4 ef ff ff    	jl     24d43c4 <skl_check_plane_surface+0x13b4>
2400  24d5410:	48 89 df             	mov    %rbx,%rdi
2403  24d5413:	e8 00 00 00 00       	call   24d5418 <skl_check_plane_surface+0x2408>	24d5414: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2408  24d5418:	44 8b 04 24          	mov    (%rsp),%r8d
240c  24d541c:	e9 a3 ef ff ff       	jmp    24d43c4 <skl_check_plane_surface+0x13b4>
2411  24d5421:	44 89 e1             	mov    %r12d,%ecx
2414  24d5424:	80 e1 07             	and    $0x7,%cl
2417  24d5427:	80 c1 03             	add    $0x3,%cl
241a  24d542a:	38 c1                	cmp    %al,%cl
241c  24d542c:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2421  24d5431:	0f 8c 24 f8 ff ff    	jl     24d4c5b <skl_check_plane_surface+0x1c4b>
2427  24d5437:	4c 89 e7             	mov    %r12,%rdi
242a  24d543a:	e8 00 00 00 00       	call   24d543f <skl_check_plane_surface+0x242f>	24d543b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
242f  24d543f:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2434  24d5444:	e9 12 f8 ff ff       	jmp    24d4c5b <skl_check_plane_surface+0x1c4b>
2439  24d5449:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
2441  24d5451:	80 e1 07             	and    $0x7,%cl
2444  24d5454:	80 c1 03             	add    $0x3,%cl
2447  24d5457:	38 c1                	cmp    %al,%cl
2449  24d5459:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
244e  24d545e:	0f 8c 16 f8 ff ff    	jl     24d4c7a <skl_check_plane_surface+0x1c6a>
2454  24d5464:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
245c  24d546c:	e8 00 00 00 00       	call   24d5471 <skl_check_plane_surface+0x2461>	24d546d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2461  24d5471:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2466  24d5476:	e9 ff f7 ff ff       	jmp    24d4c7a <skl_check_plane_surface+0x1c6a>
246b  24d547b:	44 89 f1             	mov    %r14d,%ecx
246e  24d547e:	80 e1 07             	and    $0x7,%cl
2471  24d5481:	80 c1 03             	add    $0x3,%cl
2474  24d5484:	38 c1                	cmp    %al,%cl
2476  24d5486:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
247b  24d548b:	0f 8c 14 f8 ff ff    	jl     24d4ca5 <skl_check_plane_surface+0x1c95>
2481  24d5491:	4c 89 f7             	mov    %r14,%rdi
2484  24d5494:	e8 00 00 00 00       	call   24d5499 <skl_check_plane_surface+0x2489>	24d5495: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2489  24d5499:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
248e  24d549e:	e9 02 f8 ff ff       	jmp    24d4ca5 <skl_check_plane_surface+0x1c95>
2493  24d54a3:	44 89 e9             	mov    %r13d,%ecx
2496  24d54a6:	80 e1 07             	and    $0x7,%cl
2499  24d54a9:	80 c1 03             	add    $0x3,%cl
249c  24d54ac:	38 c1                	cmp    %al,%cl
249e  24d54ae:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
24a3  24d54b3:	0f 8c ff f7 ff ff    	jl     24d4cb8 <skl_check_plane_surface+0x1ca8>
24a9  24d54b9:	4c 89 ef             	mov    %r13,%rdi
24ac  24d54bc:	e8 00 00 00 00       	call   24d54c1 <skl_check_plane_surface+0x24b1>	24d54bd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
24b1  24d54c1:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
24b6  24d54c6:	e9 ed f7 ff ff       	jmp    24d4cb8 <skl_check_plane_surface+0x1ca8>
24bb  24d54cb:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
24c0  24d54d0:	80 e1 07             	and    $0x7,%cl
24c3  24d54d3:	80 c1 03             	add    $0x3,%cl
24c6  24d54d6:	38 c1                	cmp    %al,%cl
24c8  24d54d8:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
24cd  24d54dd:	0f 8c f4 f7 ff ff    	jl     24d4cd7 <skl_check_plane_surface+0x1cc7>
24d3  24d54e3:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
24d8  24d54e8:	e8 00 00 00 00       	call   24d54ed <skl_check_plane_surface+0x24dd>	24d54e9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
24dd  24d54ed:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
24e2  24d54f2:	e9 e0 f7 ff ff       	jmp    24d4cd7 <skl_check_plane_surface+0x1cc7>
24e7  24d54f7:	44 89 e9             	mov    %r13d,%ecx
24ea  24d54fa:	80 e1 07             	and    $0x7,%cl
24ed  24d54fd:	80 c1 03             	add    $0x3,%cl
24f0  24d5500:	38 c1                	cmp    %al,%cl
24f2  24d5502:	0f 8c e7 f7 ff ff    	jl     24d4cef <skl_check_plane_surface+0x1cdf>
24f8  24d5508:	4c 89 ef             	mov    %r13,%rdi
24fb  24d550b:	e8 00 00 00 00       	call   24d5510 <skl_check_plane_surface+0x2500>	24d550c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2500  24d5510:	e9 da f7 ff ff       	jmp    24d4cef <skl_check_plane_surface+0x1cdf>
2505  24d5515:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
250a  24d551a:	80 e1 07             	and    $0x7,%cl
250d  24d551d:	80 c1 03             	add    $0x3,%cl
2510  24d5520:	38 c1                	cmp    %al,%cl
2512  24d5522:	0f 8c e0 f7 ff ff    	jl     24d4d08 <skl_check_plane_surface+0x1cf8>
2518  24d5528:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
251d  24d552d:	e8 00 00 00 00       	call   24d5532 <skl_check_plane_surface+0x2522>	24d552e: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2522  24d5532:	e9 d1 f7 ff ff       	jmp    24d4d08 <skl_check_plane_surface+0x1cf8>
2527  24d5537:	89 d9                	mov    %ebx,%ecx
2529  24d5539:	80 e1 07             	and    $0x7,%cl
252c  24d553c:	80 c1 03             	add    $0x3,%cl
252f  24d553f:	38 c1                	cmp    %al,%cl
2531  24d5541:	0f 8c e5 f7 ff ff    	jl     24d4d2c <skl_check_plane_surface+0x1d1c>
2537  24d5547:	48 89 df             	mov    %rbx,%rdi
253a  24d554a:	e8 00 00 00 00       	call   24d554f <skl_check_plane_surface+0x253f>	24d554b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
253f  24d554f:	e9 d8 f7 ff ff       	jmp    24d4d2c <skl_check_plane_surface+0x1d1c>
2544  24d5554:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
2549  24d5559:	80 e1 07             	and    $0x7,%cl
254c  24d555c:	80 c1 03             	add    $0x3,%cl
254f  24d555f:	38 c1                	cmp    %al,%cl
2551  24d5561:	0f 8c dd f7 ff ff    	jl     24d4d44 <skl_check_plane_surface+0x1d34>
2557  24d5567:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
255c  24d556c:	e8 00 00 00 00       	call   24d5571 <skl_check_plane_surface+0x2561>	24d556d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2561  24d5571:	e9 ce f7 ff ff       	jmp    24d4d44 <skl_check_plane_surface+0x1d34>
2566  24d5576:	89 d9                	mov    %ebx,%ecx
2568  24d5578:	80 e1 07             	and    $0x7,%cl
256b  24d557b:	80 c1 03             	add    $0x3,%cl
256e  24d557e:	38 c1                	cmp    %al,%cl
2570  24d5580:	0f 8c 19 ed ff ff    	jl     24d429f <skl_check_plane_surface+0x128f>
2576  24d5586:	48 89 df             	mov    %rbx,%rdi
2579  24d5589:	45 89 ce             	mov    %r9d,%r14d
257c  24d558c:	e8 00 00 00 00       	call   24d5591 <skl_check_plane_surface+0x2581>	24d558d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2581  24d5591:	44 8b 04 24          	mov    (%rsp),%r8d
2585  24d5595:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
258a  24d559a:	45 89 f1             	mov    %r14d,%r9d
258d  24d559d:	e9 fd ec ff ff       	jmp    24d429f <skl_check_plane_surface+0x128f>
2592  24d55a2:	44 89 f9             	mov    %r15d,%ecx
2595  24d55a5:	80 e1 07             	and    $0x7,%cl
2598  24d55a8:	80 c1 03             	add    $0x3,%cl
259b  24d55ab:	38 c1                	cmp    %al,%cl
259d  24d55ad:	0f 8c 04 f2 ff ff    	jl     24d47b7 <skl_check_plane_surface+0x17a7>
25a3  24d55b3:	4c 89 ff             	mov    %r15,%rdi
25a6  24d55b6:	4c 89 d5             	mov    %r10,%rbp
25a9  24d55b9:	e8 00 00 00 00       	call   24d55be <skl_check_plane_surface+0x25ae>	24d55ba: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
25ae  24d55be:	49 89 ea             	mov    %rbp,%r10
25b1  24d55c1:	e9 f1 f1 ff ff       	jmp    24d47b7 <skl_check_plane_surface+0x17a7>
25b6  24d55c6:	48 8b 0c 24          	mov    (%rsp),%rcx
25ba  24d55ca:	80 e1 07             	and    $0x7,%cl
25bd  24d55cd:	80 c1 03             	add    $0x3,%cl
25c0  24d55d0:	38 c1                	cmp    %al,%cl
25c2  24d55d2:	0f 8c 10 f3 ff ff    	jl     24d48e8 <skl_check_plane_surface+0x18d8>
25c8  24d55d8:	48 8b 3c 24          	mov    (%rsp),%rdi
25cc  24d55dc:	49 89 d6             	mov    %rdx,%r14
25cf  24d55df:	e8 00 00 00 00       	call   24d55e4 <skl_check_plane_surface+0x25d4>	24d55e0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
25d4  24d55e4:	4c 89 f2             	mov    %r14,%rdx
25d7  24d55e7:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
25dc  24d55ec:	e9 f7 f2 ff ff       	jmp    24d48e8 <skl_check_plane_surface+0x18d8>
25e1  24d55f1:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
25e6  24d55f6:	80 e1 07             	and    $0x7,%cl
25e9  24d55f9:	80 c1 03             	add    $0x3,%cl
25ec  24d55fc:	38 c1                	cmp    %al,%cl
25ee  24d55fe:	0f 8c 00 f3 ff ff    	jl     24d4904 <skl_check_plane_surface+0x18f4>
25f4  24d5604:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
25f9  24d5609:	49 89 d6             	mov    %rdx,%r14
25fc  24d560c:	44 89 c5             	mov    %r8d,%ebp
25ff  24d560f:	e8 00 00 00 00       	call   24d5614 <skl_check_plane_surface+0x2604>	24d5610: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2604  24d5614:	4c 89 f2             	mov    %r14,%rdx
2607  24d5617:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
260c  24d561c:	41 89 e8             	mov    %ebp,%r8d
260f  24d561f:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
2619  24d5629:	e9 d6 f2 ff ff       	jmp    24d4904 <skl_check_plane_surface+0x18f4>
261e  24d562e:	89 d9                	mov    %ebx,%ecx
2620  24d5630:	80 e1 07             	and    $0x7,%cl
2623  24d5633:	38 c1                	cmp    %al,%cl
2625  24d5635:	0f 8c 56 f3 ff ff    	jl     24d4991 <skl_check_plane_surface+0x1981>
262b  24d563b:	48 89 df             	mov    %rbx,%rdi
262e  24d563e:	e8 00 00 00 00       	call   24d5643 <skl_check_plane_surface+0x2633>	24d563f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2633  24d5643:	e9 49 f3 ff ff       	jmp    24d4991 <skl_check_plane_surface+0x1981>
2638  24d5648:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
263d  24d564d:	80 e1 07             	and    $0x7,%cl
2640  24d5650:	80 c1 03             	add    $0x3,%cl
2643  24d5653:	38 c1                	cmp    %al,%cl
2645  24d5655:	0f 8c 59 f3 ff ff    	jl     24d49b4 <skl_check_plane_surface+0x19a4>
264b  24d565b:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
2650  24d5660:	e8 00 00 00 00       	call   24d5665 <skl_check_plane_surface+0x2655>	24d5661: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2655  24d5665:	e9 4a f3 ff ff       	jmp    24d49b4 <skl_check_plane_surface+0x19a4>
265a  24d566a:	44 89 f1             	mov    %r14d,%ecx
265d  24d566d:	80 e1 07             	and    $0x7,%cl
2660  24d5670:	80 c1 03             	add    $0x3,%cl
2663  24d5673:	38 c1                	cmp    %al,%cl
2665  24d5675:	0f 8c 5e f7 ff ff    	jl     24d4dd9 <skl_check_plane_surface+0x1dc9>
266b  24d567b:	4c 89 f7             	mov    %r14,%rdi
266e  24d567e:	e8 00 00 00 00       	call   24d5683 <skl_check_plane_surface+0x2673>	24d567f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2673  24d5683:	e9 51 f7 ff ff       	jmp    24d4dd9 <skl_check_plane_surface+0x1dc9>
2678  24d5688:	89 d9                	mov    %ebx,%ecx
267a  24d568a:	80 e1 07             	and    $0x7,%cl
267d  24d568d:	80 c1 03             	add    $0x3,%cl
2680  24d5690:	38 c1                	cmp    %al,%cl
2682  24d5692:	0f 8c 64 e3 ff ff    	jl     24d39fc <skl_check_plane_surface+0x9ec>
2688  24d5698:	48 89 df             	mov    %rbx,%rdi
268b  24d569b:	4c 89 84 24 a0 00 00 00 	mov    %r8,0xa0(%rsp)
2693  24d56a3:	4c 89 d5             	mov    %r10,%rbp
2696  24d56a6:	44 89 4c 24 14       	mov    %r9d,0x14(%rsp)
269b  24d56ab:	e8 00 00 00 00       	call   24d56b0 <skl_check_plane_surface+0x26a0>	24d56ac: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
26a0  24d56b0:	44 8b 4c 24 14       	mov    0x14(%rsp),%r9d
26a5  24d56b5:	4c 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%r8
26ad  24d56bd:	49 89 ea             	mov    %rbp,%r10
26b0  24d56c0:	e9 37 e3 ff ff       	jmp    24d39fc <skl_check_plane_surface+0x9ec>
26b5  24d56c5:	89 d9                	mov    %ebx,%ecx
26b7  24d56c7:	80 e1 07             	and    $0x7,%cl
26ba  24d56ca:	38 c1                	cmp    %al,%cl
26bc  24d56cc:	0f 8c 29 ec ff ff    	jl     24d42fb <skl_check_plane_surface+0x12eb>
26c2  24d56d2:	48 89 df             	mov    %rbx,%rdi
26c5  24d56d5:	45 89 cf             	mov    %r9d,%r15d
26c8  24d56d8:	e8 00 00 00 00       	call   24d56dd <skl_check_plane_surface+0x26cd>	24d56d9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
26cd  24d56dd:	44 8b 04 24          	mov    (%rsp),%r8d
26d1  24d56e1:	45 89 f9             	mov    %r15d,%r9d
26d4  24d56e4:	e9 12 ec ff ff       	jmp    24d42fb <skl_check_plane_surface+0x12eb>
26d9  24d56e9:	89 d9                	mov    %ebx,%ecx
26db  24d56eb:	80 e1 07             	and    $0x7,%cl
26de  24d56ee:	80 c1 03             	add    $0x3,%cl
26e1  24d56f1:	38 c1                	cmp    %al,%cl
26e3  24d56f3:	0f 8c 7e e7 ff ff    	jl     24d3e77 <skl_check_plane_surface+0xe67>
26e9  24d56f9:	48 89 df             	mov    %rbx,%rdi
26ec  24d56fc:	e8 00 00 00 00       	call   24d5701 <skl_check_plane_surface+0x26f1>	24d56fd: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
26f1  24d5701:	e9 71 e7 ff ff       	jmp    24d3e77 <skl_check_plane_surface+0xe67>
26f6  24d5706:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
26fb  24d570b:	80 e1 07             	and    $0x7,%cl
26fe  24d570e:	80 c1 03             	add    $0x3,%cl
2701  24d5711:	38 c1                	cmp    %al,%cl
2703  24d5713:	0f 8c 76 e7 ff ff    	jl     24d3e8f <skl_check_plane_surface+0xe7f>
2709  24d5719:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
270e  24d571e:	e8 00 00 00 00       	call   24d5723 <skl_check_plane_surface+0x2713>	24d571f: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2713  24d5723:	e9 67 e7 ff ff       	jmp    24d3e8f <skl_check_plane_surface+0xe7f>
2718  24d5728:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
2720  24d5730:	80 e1 07             	and    $0x7,%cl
2723  24d5733:	80 c1 03             	add    $0x3,%cl
2726  24d5736:	38 c1                	cmp    %al,%cl
2728  24d5738:	0f 8c 77 e7 ff ff    	jl     24d3eb5 <skl_check_plane_surface+0xea5>
272e  24d573e:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
2736  24d5746:	e8 00 00 00 00       	call   24d574b <skl_check_plane_surface+0x273b>	24d5747: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
273b  24d574b:	e9 65 e7 ff ff       	jmp    24d3eb5 <skl_check_plane_surface+0xea5>
2740  24d5750:	44 89 f1             	mov    %r14d,%ecx
2743  24d5753:	80 e1 07             	and    $0x7,%cl
2746  24d5756:	80 c1 03             	add    $0x3,%cl
2749  24d5759:	38 c1                	cmp    %al,%cl
274b  24d575b:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2750  24d5760:	0f 8c a5 f6 ff ff    	jl     24d4e0b <skl_check_plane_surface+0x1dfb>
2756  24d5766:	4c 89 f7             	mov    %r14,%rdi
2759  24d5769:	e8 00 00 00 00       	call   24d576e <skl_check_plane_surface+0x275e>	24d576a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
275e  24d576e:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
2763  24d5773:	e9 93 f6 ff ff       	jmp    24d4e0b <skl_check_plane_surface+0x1dfb>
2768  24d5778:	89 d9                	mov    %ebx,%ecx
276a  24d577a:	80 e1 07             	and    $0x7,%cl
276d  24d577d:	38 c1                	cmp    %al,%cl
276f  24d577f:	0f 8c aa e3 ff ff    	jl     24d3b2f <skl_check_plane_surface+0xb1f>
2775  24d5785:	48 89 df             	mov    %rbx,%rdi
2778  24d5788:	e8 00 00 00 00       	call   24d578d <skl_check_plane_surface+0x277d>	24d5789: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
277d  24d578d:	e9 9d e3 ff ff       	jmp    24d3b2f <skl_check_plane_surface+0xb1f>
2782  24d5792:	89 d9                	mov    %ebx,%ecx
2784  24d5794:	80 e1 07             	and    $0x7,%cl
2787  24d5797:	38 c1                	cmp    %al,%cl
2789  24d5799:	0f 8c c7 e3 ff ff    	jl     24d3b66 <skl_check_plane_surface+0xb56>
278f  24d579f:	48 89 df             	mov    %rbx,%rdi
2792  24d57a2:	e8 00 00 00 00       	call   24d57a7 <skl_check_plane_surface+0x2797>	24d57a3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2797  24d57a7:	e9 ba e3 ff ff       	jmp    24d3b66 <skl_check_plane_surface+0xb56>
279c  24d57ac:	89 d9                	mov    %ebx,%ecx
279e  24d57ae:	80 e1 07             	and    $0x7,%cl
27a1  24d57b1:	80 c1 03             	add    $0x3,%cl
27a4  24d57b4:	38 c1                	cmp    %al,%cl
27a6  24d57b6:	0f 8c e6 e3 ff ff    	jl     24d3ba2 <skl_check_plane_surface+0xb92>
27ac  24d57bc:	48 89 df             	mov    %rbx,%rdi
27af  24d57bf:	e8 00 00 00 00       	call   24d57c4 <skl_check_plane_surface+0x27b4>	24d57c0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
27b4  24d57c4:	e9 d9 e3 ff ff       	jmp    24d3ba2 <skl_check_plane_surface+0xb92>
27b9  24d57c9:	44 89 f9             	mov    %r15d,%ecx
27bc  24d57cc:	80 e1 07             	and    $0x7,%cl
27bf  24d57cf:	80 c1 03             	add    $0x3,%cl
27c2  24d57d2:	38 c1                	cmp    %al,%cl
27c4  24d57d4:	0f 8c 48 e6 ff ff    	jl     24d3e22 <skl_check_plane_surface+0xe12>
27ca  24d57da:	4c 89 ff             	mov    %r15,%rdi
27cd  24d57dd:	e8 00 00 00 00       	call   24d57e2 <skl_check_plane_surface+0x27d2>	24d57de: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
27d2  24d57e2:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
27d7  24d57e7:	e9 36 e6 ff ff       	jmp    24d3e22 <skl_check_plane_surface+0xe12>
27dc  24d57ec:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d57ef: R_X86_64_32S	.data+0xabc420
27e3  24d57f3:	48 89 de             	mov    %rbx,%rsi
27e6  24d57f6:	e8 00 00 00 00       	call   24d57fb <skl_check_plane_surface+0x27eb>	24d57f7: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
27eb  24d57fb:	44 8b 04 24          	mov    (%rsp),%r8d
27ef  24d57ff:	45 89 f9             	mov    %r15d,%r9d
27f2  24d5802:	c7 84 24 a8 00 00 00 00 00 00 00 	movl   $0x0,0xa8(%rsp)
27fd  24d580d:	e9 52 e9 ff ff       	jmp    24d4164 <skl_check_plane_surface+0x1154>
2802  24d5812:	48 8b 0c 24          	mov    (%rsp),%rcx
2806  24d5816:	80 e1 07             	and    $0x7,%cl
2809  24d5819:	80 c1 03             	add    $0x3,%cl
280c  24d581c:	38 c1                	cmp    %al,%cl
280e  24d581e:	0f 8c da e3 ff ff    	jl     24d3bfe <skl_check_plane_surface+0xbee>
2814  24d5824:	48 8b 3c 24          	mov    (%rsp),%rdi
2818  24d5828:	49 89 d6             	mov    %rdx,%r14
281b  24d582b:	e8 00 00 00 00       	call   24d5830 <skl_check_plane_surface+0x2820>	24d582c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2820  24d5830:	4c 89 f2             	mov    %r14,%rdx
2823  24d5833:	e9 c6 e3 ff ff       	jmp    24d3bfe <skl_check_plane_surface+0xbee>
2828  24d5838:	44 89 e1             	mov    %r12d,%ecx
282b  24d583b:	80 e1 07             	and    $0x7,%cl
282e  24d583e:	80 c1 03             	add    $0x3,%cl
2831  24d5841:	38 c1                	cmp    %al,%cl
2833  24d5843:	0f 8c d0 e3 ff ff    	jl     24d3c19 <skl_check_plane_surface+0xc09>
2839  24d5849:	4c 89 e7             	mov    %r12,%rdi
283c  24d584c:	48 89 d3             	mov    %rdx,%rbx
283f  24d584f:	44 89 c5             	mov    %r8d,%ebp
2842  24d5852:	e8 00 00 00 00       	call   24d5857 <skl_check_plane_surface+0x2847>	24d5853: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2847  24d5857:	41 89 e8             	mov    %ebp,%r8d
284a  24d585a:	48 89 da             	mov    %rbx,%rdx
284d  24d585d:	e9 b7 e3 ff ff       	jmp    24d3c19 <skl_check_plane_surface+0xc09>
2852  24d5862:	44 89 f1             	mov    %r14d,%ecx
2855  24d5865:	80 e1 07             	and    $0x7,%cl
2858  24d5868:	80 c1 03             	add    $0x3,%cl
285b  24d586b:	38 c1                	cmp    %al,%cl
285d  24d586d:	0f 8c e0 e5 ff ff    	jl     24d3e53 <skl_check_plane_surface+0xe43>
2863  24d5873:	4c 89 f7             	mov    %r14,%rdi
2866  24d5876:	e8 00 00 00 00       	call   24d587b <skl_check_plane_surface+0x286b>	24d5877: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
286b  24d587b:	e9 d3 e5 ff ff       	jmp    24d3e53 <skl_check_plane_surface+0xe43>
2870  24d5880:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
2875  24d5885:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d5888: R_X86_64_32S	.data+0xabc440
287c  24d588c:	4c 89 f6             	mov    %r14,%rsi
287f  24d588f:	e8 00 00 00 00       	call   24d5894 <skl_check_plane_surface+0x2884>	24d5890: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2884  24d5894:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
2889  24d5899:	44 89 f0             	mov    %r14d,%eax
288c  24d589c:	c1 e0 04             	shl    $0x4,%eax
288f  24d589f:	4c 8d b4 01 f8 00 00 00 	lea    0xf8(%rcx,%rax,1),%r14
2897  24d58a7:	4c 89 f0             	mov    %r14,%rax
289a  24d58aa:	48 c1 e8 03          	shr    $0x3,%rax
289e  24d58ae:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
28a2  24d58b2:	84 c0                	test   %al,%al
28a4  24d58b4:	0f 85 0f 01 00 00    	jne    24d59c9 <skl_check_plane_surface+0x29b9>
28aa  24d58ba:	45 3b 26             	cmp    (%r14),%r12d
28ad  24d58bd:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
28b2  24d58c2:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
28b7  24d58c7:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
28c1  24d58d1:	0f 85 3d f5 ff ff    	jne    24d4e14 <skl_check_plane_surface+0x1e04>
28c7  24d58d7:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
28cc  24d58dc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d58df: R_X86_64_32S	.data+0xabc460
28d3  24d58e3:	e8 00 00 00 00       	call   24d58e8 <skl_check_plane_surface+0x28d8>	24d58e4: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
28d8  24d58e8:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
28dd  24d58ed:	e9 f6 f4 ff ff       	jmp    24d4de8 <skl_check_plane_surface+0x1dd8>
28e2  24d58f2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d58f5: R_X86_64_32S	.data+0xabc300
28e9  24d58f9:	e8 00 00 00 00       	call   24d58fe <skl_check_plane_surface+0x28ee>	24d58fa: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
28ee  24d58fe:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
28f3  24d5903:	e9 7a e2 ff ff       	jmp    24d3b82 <skl_check_plane_surface+0xb72>
28f8  24d5908:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
28fd  24d590d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d5910: R_X86_64_32S	.data+0xabc320
2904  24d5914:	4c 89 f6             	mov    %r14,%rsi
2907  24d5917:	e8 00 00 00 00       	call   24d591c <skl_check_plane_surface+0x290c>	24d5918: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
290c  24d591c:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
2911  24d5921:	44 89 f0             	mov    %r14d,%eax
2914  24d5924:	c1 e0 04             	shl    $0x4,%eax
2917  24d5927:	4c 8d bc 01 f8 00 00 00 	lea    0xf8(%rcx,%rax,1),%r15
291f  24d592f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2929  24d5939:	4c 89 f8             	mov    %r15,%rax
292c  24d593c:	48 c1 e8 03          	shr    $0x3,%rax
2930  24d5940:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
2934  24d5944:	84 c0                	test   %al,%al
2936  24d5946:	0f 85 9b 00 00 00    	jne    24d59e7 <skl_check_plane_surface+0x29d7>
293c  24d594c:	45 3b 27             	cmp    (%r15),%r12d
293f  24d594f:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
2944  24d5954:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
2949  24d5959:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
294e  24d595e:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
2958  24d5968:	75 16                	jne    24d5980 <skl_check_plane_surface+0x2970>
295a  24d596a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	24d596d: R_X86_64_32S	.data+0xabc340
2961  24d5971:	e8 00 00 00 00       	call   24d5976 <skl_check_plane_surface+0x2966>	24d5972: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2966  24d5976:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
296b  24d597b:	e9 b5 e4 ff ff       	jmp    24d3e35 <skl_check_plane_surface+0xe25>
2970  24d5980:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
2975  24d5985:	48 83 c3 18          	add    $0x18,%rbx
2979  24d5989:	48 89 d8             	mov    %rbx,%rax
297c  24d598c:	48 c1 e8 03          	shr    $0x3,%rax
2980  24d5990:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
2984  24d5994:	74 08                	je     24d599e <skl_check_plane_surface+0x298e>
2986  24d5996:	48 89 df             	mov    %rbx,%rdi
2989  24d5999:	e8 00 00 00 00       	call   24d599e <skl_check_plane_surface+0x298e>	24d599a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
298e  24d599e:	48 8b 3b             	mov    (%rbx),%rdi
2991  24d59a1:	be 04 00 00 00       	mov    $0x4,%esi
2996  24d59a6:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	24d59a9: R_X86_64_32S	.rodata+0x9e2ec0
299d  24d59ad:	e8 00 00 00 00       	call   24d59b2 <skl_check_plane_surface+0x29a2>	24d59ae: R_X86_64_PLT32	drm_dev_dbg-0x4
29a2  24d59b2:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
29a7  24d59b7:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
29ae  24d59be:	5b                   	pop    %rbx
29af  24d59bf:	41 5c                	pop    %r12
29b1  24d59c1:	41 5d                	pop    %r13
29b3  24d59c3:	41 5e                	pop    %r14
29b5  24d59c5:	41 5f                	pop    %r15
29b7  24d59c7:	5d                   	pop    %rbp
29b8  24d59c8:	c3                   	ret
29b9  24d59c9:	44 89 f1             	mov    %r14d,%ecx
29bc  24d59cc:	80 e1 07             	and    $0x7,%cl
29bf  24d59cf:	80 c1 03             	add    $0x3,%cl
29c2  24d59d2:	38 c1                	cmp    %al,%cl
29c4  24d59d4:	0f 8c e0 fe ff ff    	jl     24d58ba <skl_check_plane_surface+0x28aa>
29ca  24d59da:	4c 89 f7             	mov    %r14,%rdi
29cd  24d59dd:	e8 00 00 00 00       	call   24d59e2 <skl_check_plane_surface+0x29d2>	24d59de: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
29d2  24d59e2:	e9 d3 fe ff ff       	jmp    24d58ba <skl_check_plane_surface+0x28aa>
29d7  24d59e7:	44 89 f9             	mov    %r15d,%ecx
29da  24d59ea:	80 e1 07             	and    $0x7,%cl
29dd  24d59ed:	80 c1 03             	add    $0x3,%cl
29e0  24d59f0:	38 c1                	cmp    %al,%cl
29e2  24d59f2:	0f 8c 54 ff ff ff    	jl     24d594c <skl_check_plane_surface+0x293c>
29e8  24d59f8:	4c 89 ff             	mov    %r15,%rdi
29eb  24d59fb:	e8 00 00 00 00       	call   24d5a00 <skl_check_plane_surface+0x29f0>	24d59fc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
29f0  24d5a00:	e9 47 ff ff ff       	jmp    24d594c <skl_check_plane_surface+0x293c>
29f5  24d5a05:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
