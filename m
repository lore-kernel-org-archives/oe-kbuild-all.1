Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2833910FA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 03:21:55 +0000 (UTC)
Received: from dggpeml100012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NplpF6xr1zJqpR
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 11:20:37 +0800 (CST)
Received: from [10.67.110.218] (10.67.110.218) by
 dggpeml100012.china.huawei.com (7.185.36.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 7 Jan 2023 11:21:52 +0800
Message-ID: <8d656caf-e172-15eb-d981-ebb5bb221a13@huawei.com>
Date: Sat, 7 Jan 2023 11:21:35 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: vmlinux.o: warning: objtool: __rcu_irq_enter_check_tick+0x53:
 call to tick_nohz_full_enabled() leaves .noinstr.text section
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <202301070317.ER1yHhub-lkp@intel.com>
From: Zheng Yejian <zhengyejian1@huawei.com>
In-Reply-To: <202301070317.ER1yHhub-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.218]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml100012.china.huawei.com (7.185.36.121)
X-CFilter-Loop: Reflected

On 2023/1/7 03:26, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Zheng-Yejian/rcu-Avoid-kernel-stack-overflow-due-to-rcu_irq_enter_check_tick-being-kprobe-ed/20230106-115619
> head:   a84e53196642377a85453a061ffca739097cfd1f
> commit: e4f5c05fa442271513346b35f3cce657d55868d8 rcu: Fix kernel stack overflow caused by kprobe on rcu_irq_enter_check_tick()

Thanks for your test!

But please drop commit e4f5c05fa442271513346b35f3cce657d55868d8 rcu: Fix
kernel stack overflow caused by kprobe on rcu_irq_enter_check_tick()
Link: 
https://github.com/intel-lab-lkp/linux/commit/e4f5c05fa442271513346b35f3cce657d55868d8

Because commit a84e53196642377a85453a061ffca739097cfd1f solve the same
issue as e4f5c05fa442271513346b35f3cce657d55868d8, and commit
a84e53196642377a85453a061ffca739097cfd1f may be a better solution.

And I found title of commit a84e53196642377a85453a061ffca739097cfd1f
is not clear enough, so I send a new renamed patch
Link: 
https://lore.kernel.org/lkml/20230106070934.3434031-1-zhengyejian1@huawei.com/#t

Sorry for such a mess I've done :(

> date:   15 hours ago
> config: x86_64-randconfig-s021
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>          # apt-get install sparse
>          # sparse version: v0.6.4-39-gce1a6720-dirty
>          # https://github.com/intel-lab-lkp/linux/commit/e4f5c05fa442271513346b35f3cce657d55868d8
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Zheng-Yejian/rcu-Avoid-kernel-stack-overflow-due-to-rcu_irq_enter_check_tick-being-kprobe-ed/20230106-115619
>          git checkout e4f5c05fa442271513346b35f3cce657d55868d8
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
>          make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> vmlinux.o: warning: objtool: __rcu_irq_enter_check_tick+0x53: call to tick_nohz_full_enabled() leaves .noinstr.text section
>     vmlinux.o: warning: objtool: __ct_user_enter+0xaa: call to __kasan_check_write() leaves .noinstr.text section
>     vmlinux.o: warning: objtool: __ct_user_exit+0x87: call to __kasan_check_write() leaves .noinstr.text section
> 
> 
> objdump-func vmlinux.o __rcu_irq_enter_check_tick:
> 0000 0000000000005200 <__rcu_irq_enter_check_tick>:
> 0000     5200:	f3 0f 1e fa          	endbr64
> 0004     5204:	55                   	push   %rbp
> 0005     5205:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 520c <__rcu_irq_enter_check_tick+0xc>	5208: R_X86_64_PC32	pcpu_hot+0x4
> 000c     520c:	48 89 e5             	mov    %rsp,%rbp
> 000f     520f:	41 55                	push   %r13
> 0011     5211:	41 54                	push   %r12
> 0013     5213:	53                   	push   %rbx
> 0014     5214:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	5217: R_X86_64_32S	.data..percpu..shared_aligned+0x17c0
> 001b     521b:	65 48 03 1d 00 00 00 00 	add    %gs:0x0(%rip),%rbx        # 5223 <__rcu_irq_enter_check_tick+0x23>	521f: R_X86_64_PC32	this_cpu_off-0x4
> 0023     5223:	a9 00 00 f0 00       	test   $0xf00000,%eax
> 0028     5228:	74 07                	je     5231 <__rcu_irq_enter_check_tick+0x31>
> 002a     522a:	5b                   	pop    %rbx
> 002b     522b:	41 5c                	pop    %r12
> 002d     522d:	41 5d                	pop    %r13
> 002f     522f:	5d                   	pop    %rbp
> 0030     5230:	c3                   	ret
> 0031     5231:	e8 00 00 00 00       	call   5236 <__rcu_irq_enter_check_tick+0x36>	5232: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
> 0036     5236:	85 c0                	test   %eax,%eax
> 0038     5238:	74 19                	je     5253 <__rcu_irq_enter_check_tick+0x53>
> 003a     523a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	523d: R_X86_64_32S	context_tracking+0x8
> 0041     5241:	65 48 03 05 00 00 00 00 	add    %gs:0x0(%rip),%rax        # 5249 <__rcu_irq_enter_check_tick+0x49>	5245: R_X86_64_PC32	this_cpu_off-0x4
> 0049     5249:	8b 00                	mov    (%rax),%eax
> 004b     524b:	a8 04                	test   $0x4,%al
> 004d     524d:	0f 84 bb 00 00 00    	je     530e <__rcu_irq_enter_check_tick+0x10e>
> 0053     5253:	e8 00 00 00 00       	call   5258 <__rcu_irq_enter_check_tick+0x58>	5254: R_X86_64_PC32	.text+0x46920c
> 0058     5258:	84 c0                	test   %al,%al
> 005a     525a:	74 ce                	je     522a <__rcu_irq_enter_check_tick+0x2a>
> 005c     525c:	44 8b a3 90 05 00 00 	mov    0x590(%rbx),%r12d
> 0063     5263:	44 3b 25 00 00 00 00 	cmp    0x0(%rip),%r12d        # 526a <__rcu_irq_enter_check_tick+0x6a>	5266: R_X86_64_PC32	nr_cpu_ids-0x4
> 006a     526a:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 5271 <__rcu_irq_enter_check_tick+0x71>	526d: R_X86_64_PC32	tick_nohz_full_mask-0x4
> 0071     5271:	0f 83 d5 00 00 00    	jae    534c <__rcu_irq_enter_check_tick+0x14c>
> 0077     5277:	4c 89 e0             	mov    %r12,%rax
> 007a     527a:	be 08 00 00 00       	mov    $0x8,%esi
> 007f     527f:	48 c1 e8 06          	shr    $0x6,%rax
> 0083     5283:	49 8d 7c c5 00       	lea    0x0(%r13,%rax,8),%rdi
> 0088     5288:	e8 00 00 00 00       	call   528d <__rcu_irq_enter_check_tick+0x8d>	5289: R_X86_64_PLT32	__kasan_check_read-0x4
> 008d     528d:	4d 0f a3 65 00       	bt     %r12,0x0(%r13)
> 0092     5292:	73 96                	jae    522a <__rcu_irq_enter_check_tick+0x2a>
> 0094     5294:	0f b6 83 3d 01 00 00 	movzbl 0x13d(%rbx),%eax
> 009b     529b:	84 c0                	test   %al,%al
> 009d     529d:	74 8b                	je     522a <__rcu_irq_enter_check_tick+0x2a>
> 009f     529f:	0f b6 83 3e 01 00 00 	movzbl 0x13e(%rbx),%eax
> 00a6     52a6:	84 c0                	test   %al,%al
> 00a8     52a8:	75 80                	jne    522a <__rcu_irq_enter_check_tick+0x2a>
> 00aa     52aa:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
> 00ae     52ae:	e8 00 00 00 00       	call   52b3 <__rcu_irq_enter_check_tick+0xb3>	52af: R_X86_64_PLT32	_raw_spin_lock-0x4
> 00b3     52b3:	80 bb 3d 01 00 00 00 	cmpb   $0x0,0x13d(%rbx)
> 00ba     52ba:	74 20                	je     52dc <__rcu_irq_enter_check_tick+0xdc>
> 00bc     52bc:	80 bb 3e 01 00 00 00 	cmpb   $0x0,0x13e(%rbx)
> 00c3     52c3:	75 17                	jne    52dc <__rcu_irq_enter_check_tick+0xdc>
> 00c5     52c5:	c6 83 3e 01 00 00 01 	movb   $0x1,0x13e(%rbx)
> 00cc     52cc:	8b bb 90 05 00 00    	mov    0x590(%rbx),%edi
> 00d2     52d2:	be 04 00 00 00       	mov    $0x4,%esi
> 00d7     52d7:	e8 00 00 00 00       	call   52dc <__rcu_irq_enter_check_tick+0xdc>	52d8: R_X86_64_PC32	.text+0x47b44c
> 00dc     52dc:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 52e2 <__rcu_irq_enter_check_tick+0xe2>	52de: R_X86_64_PC32	debug_locks-0x4
> 00e2     52e2:	85 c0                	test   %eax,%eax
> 00e4     52e4:	74 1a                	je     5300 <__rcu_irq_enter_check_tick+0x100>
> 00e6     52e6:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 52ed <__rcu_irq_enter_check_tick+0xed>	52e9: R_X86_64_PC32	lockdep_recursion-0x4
> 00ed     52ed:	85 c0                	test   %eax,%eax
> 00ef     52ef:	75 0f                	jne    5300 <__rcu_irq_enter_check_tick+0x100>
> 00f1     52f1:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 52f8 <__rcu_irq_enter_check_tick+0xf8>	52f4: R_X86_64_PC32	hardirqs_enabled-0x4
> 00f8     52f8:	85 c0                	test   %eax,%eax
> 00fa     52fa:	74 04                	je     5300 <__rcu_irq_enter_check_tick+0x100>
> 00fc     52fc:	90                   	nop
> 00fd     52fd:	0f 0b                	ud2
> 00ff     52ff:	90                   	nop
> 0100     5300:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
> 0104     5304:	e8 00 00 00 00       	call   5309 <__rcu_irq_enter_check_tick+0x109>	5305: R_X86_64_PLT32	_raw_spin_unlock-0x4
> 0109     5309:	e9 1c ff ff ff       	jmp    522a <__rcu_irq_enter_check_tick+0x2a>
> 010e     530e:	e8 00 00 00 00       	call   5313 <__rcu_irq_enter_check_tick+0x113>	530f: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
> 0113     5313:	85 c0                	test   %eax,%eax
> 0115     5315:	0f 84 38 ff ff ff    	je     5253 <__rcu_irq_enter_check_tick+0x53>
> 011b     531b:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 5322 <__rcu_irq_enter_check_tick+0x122>	531d: R_X86_64_PC32	.data.unlikely+0x15b
> 0122     5322:	0f 85 2b ff ff ff    	jne    5253 <__rcu_irq_enter_check_tick+0x53>
> 0128     5328:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	532b: R_X86_64_32S	.rodata+0xbd580
> 012f     532f:	be 69 02 00 00       	mov    $0x269,%esi
> 0134     5334:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5337: R_X86_64_32S	.rodata+0xb9f00
> 013b     533b:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 5342 <__rcu_irq_enter_check_tick+0x142>	533d: R_X86_64_PC32	.data.unlikely+0x15b
> 0142     5342:	e8 00 00 00 00       	call   5347 <__rcu_irq_enter_check_tick+0x147>	5343: R_X86_64_PLT32	lockdep_rcu_suspicious-0x4
> 0147     5347:	e9 07 ff ff ff       	jmp    5253 <__rcu_irq_enter_check_tick+0x53>
> 014c     534c:	90                   	nop
> 014d     534d:	0f 0b                	ud2
> 014f     534f:	90                   	nop
> 0150     5350:	e9 22 ff ff ff       	jmp    5277 <__rcu_irq_enter_check_tick+0x77>
> 0155     5355:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
> 015f     535f:	90                   	nop
> 
