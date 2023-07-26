Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123EB4C9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 04:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gGQqmEecuaTFiQxxMSOE2accaU3DLQGrJtQie798jPY=; b=u/MJN4KtHAUso/kCXMFU+Y9v5M
	JdVXS4LDHSSaY+YBq8bt1sGgBhfH0H+/xztHCmCntnneUwLKkPEALPAV1jMQpdzZyaR8blnYSboDu
	Dbl7gDKHAiJD9Wi2ovsxmGRjJorhAB0D1WWrCRhlcMf7wT10pA9h6BRbqXSwmka3CYnwonw2sPGam
	EytefpfHtMxjFaUzbqlQxNsq70bKx6wn25D9GjIymsUolADnPb9WkAE6SJg6IXiwav0rAaF73JaTB
	JTgTrYWjri2WfMhgt/BT9iGCXFiOsrsdUMDMG5C97F9wuthA8CVL0iMjmeIW+j1g9hQykn80mVK48
	ZA967J/w==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOW6C-0097Qt-1v;
	Wed, 26 Jul 2023 04:26:08 +0000
Message-ID: <7cbaf2e2-b912-4d97-4d49-5bc68a1e5d00@infradead.org>
Date: Tue, 25 Jul 2023 21:26:07 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: arch/riscv/net/bpf_jit.h:241:30: sparse: sparse: cast truncates
 bits from constant value (7ff becomes ff)
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Luke Nelson <lukenels@cs.washington.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>
References: <202307260704.dUElCrWU-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202307260704.dUElCrWU-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[add Luke Nelson]

[why on earth was this sent to me?]

On 7/25/23 16:34, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   af2e19389c2c1d8a299e04c5105b180ef0c5b5b5
> commit: 2d311f480b52eeb2e1fd432d64b78d82952c3808 riscv, bpf: Fix patch_text implicit declaration
> date:   5 months ago
> config: riscv-randconfig-r072-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260704.dUElCrWU-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260704.dUElCrWU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307260704.dUElCrWU-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    WARNING: invalid argument to '-march': '_zicbom_zihintpause'
>    arch/riscv/net/bpf_jit_comp64.c: note: in included file:
>>> arch/riscv/net/bpf_jit.h:241:30: sparse: sparse: cast truncates bits from constant value (7ff becomes ff)
> 
> vim +241 arch/riscv/net/bpf_jit.h
> 
> ca6cb5447ceca6 Luke Nelson 2020-03-04  238  
> ca6cb5447ceca6 Luke Nelson 2020-03-04  239  static inline u32 rv_s_insn(u16 imm11_0, u8 rs2, u8 rs1, u8 funct3, u8 opcode)
> ca6cb5447ceca6 Luke Nelson 2020-03-04  240  {
> ca6cb5447ceca6 Luke Nelson 2020-03-04 @241  	u8 imm11_5 = imm11_0 >> 5, imm4_0 = imm11_0 & 0x1f;
> ca6cb5447ceca6 Luke Nelson 2020-03-04  242  
> ca6cb5447ceca6 Luke Nelson 2020-03-04  243  	return (imm11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) |
> ca6cb5447ceca6 Luke Nelson 2020-03-04  244  		(imm4_0 << 7) | opcode;
> ca6cb5447ceca6 Luke Nelson 2020-03-04  245  }
> ca6cb5447ceca6 Luke Nelson 2020-03-04  246  
> 
> :::::: The code at line 241 was first introduced by commit
> :::::: ca6cb5447ceca6a87d6b62c9e5d41042c34f7ffa riscv, bpf: Factor common RISC-V JIT code
> 
> :::::: TO: Luke Nelson <lukenels@cs.washington.edu>
> :::::: CC: Daniel Borkmann <daniel@iogearbox.net>
> 

-- 
~Randy
