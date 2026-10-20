Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474487;
	b=bZfZbsdK4luqeSSPGiisOzzXtf0fSP+yUg9syHuFyy3NqasJlRO2SxBrbCd9sYmStby7
	 Mqrx3zDxxPh2pkJjpFqiIZryl2KNzWz/PL8eVzgt3l8n7oNgvzkm4DDCOoG5RgKdlNe+W
	 9L5XMOdQaLuDI+i2Pwq9DLWUpIYm6xkMbaO3/wsAndjnRlcAeG/oniyTDHJiTaJKT9d2Z
	 Dq10NsikCf9Naa7utos41ioib40P/aJVprlfhfSoGXB22Vm0O2qhO2ImFcfNCf80F0gAg
	 0IQw06eoy1+CzrMBUSPS6f3McxTM1+/xqfS9c1uGYDlj0LNQV1zNiGf2PRplGNH29wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474487;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=qh+/bZXJ8PZht9XIAB/y6J7Fil2F2AZNpW/Y6UfVrsA=;
	b=kcANz7eO2PdKt83M35gXE4gu2CoIWp+IFIDN5Cr9OmyD9AoYJlB0E0jHwKPscRDIuclc
	 jzFcL+MccNaAw//pwbkRba9YT8WR/OmMSyhCPOJl9ZWzqrteUQJJhaXE0TYWeotCbWfO4
	 lPtn4LXsiDELF2cunmUmI7d7DkSW2jTtx8u4UAIp0DlR5jIDiwisfgWqmDzJjH+kxDVlP
	 c3X3wD3U5RvuceJVu1e3NN6dNFUFCm41sGmBfmwyqkG6jRZgOoo5L4rdjDcNXYuPOtqdG
	 /tJieHoRRU18uj+fo9e6/EF+QEgCxm1ANHrqdyES6lRnf0ohH4k/NEykzOixACTa7GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+QxLcYr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE5606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+QxLcYr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1841F000C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 05:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792474486;
	bh=qh+/bZXJ8PZht9XIAB/y6J7Fil2F2AZNpW/Y6UfVrsA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=M+QxLcYrb3a3BUkcMEUZeKP9JhMauo119x02q+uhcmY67KOgEzxpLVteawBBSv7gC
	 ls8XNMuNb9uj41CfLEZ093gD1ZyLDc1l5xboCOUmvUGukRQCT94xmfhTcKZN1DHjvY
	 lTI00vPaBYfBnAy+clm+gFHHuvo6E2ZZpaXh4CQrgAcAgG9NuUwI9XUc0fZcFJ1FdG
	 hPvLYdyAkmq2K6mOo7JZhDHt68hTiY+EycuBK1WuYNAU/9vcGFwFbYxi+WfHVyxJ4l
	 hDOnnyY6QJn1iRnzOYq4c9qzaUCWehsrcm7cKHgMbCO1tdmWsyGaj+w03YWUcrXvo9
	 LbVx397PbLNSg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 47ABE198004A;
	Tue, 20 Oct 2026 01:34:44 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 20 Oct 2026 01:34:44 -0400
X-ME-Sender: <xms:c_3WaiBaMA7gKW_myw72X83gbf4tKHyUJma5q7l83DvZe163QarD0w>
    <xme:c_3WanXznSxbyCByizVcswo1-fp0qV9FFZVXBpgKBdMK1BNKM-kaIgPOGmhkMg3mc
    ijRM0gpYM-BIlDSomgXtxrsMMdqbOxG7VKJ9VTCggoTcIZFckb76jw>
X-ME-Proxy-Cause: dmFkZTGB160wOmKXVkMglopWQi1otYh4G2WXvYDrKiX98cC7jJqzvpK49ikJkWkzC23aLS
    vqTHTPh3QeDpMnYmNPxRdcYIyNNrKwZ1lCkbDTCk2doP+f044FLqfKt7CO7AXGFvri9GR+
    CW+VOzYUHyGXbtIzuRUhXMzQF+KEvUn91YJ4++E5G2omUo5BdWmka2aNtdX12mwMMNsHFf
    omovek6ldh6NS68QiSIaq/HdVi8Jjni3iwLAsDtLcAybHEZrF7+N5oKlKkAzQtaWBitHQj
    2Buonutq66BBl9B+qLKUPRPutTDN8Jx9qwFq1v5QYC2WKhyV4d9xz+2cn7bMckmERWjzGw
    jAOEAqLGmwB6mcGP6ENl6jiifhw43zgNPazj258RrFs2DNYeEsCf9i5ZdQZnMFKuy7uyuI
    qWDiRnow+nLbjvQLHkEoXkpVPgo3uqRsuDOui2HqpfraRJyZD7EGAtBCdqth8lWdc6ze1E
    2R+V83vMJMofOh2hWrNdliP1cdSe25pkvANZ1EtFWFOq/uqrNg5/BzVllh5Da+Md90S2t5
    0TV+3wlYPUgl9HG4vXCzTm/asuOmb3ohd1ud7xsxLvQTId7YuUix2pV9DuBq15pRCmH4py
    T3ziGRamfr7L89qTVtcoSmw/V2cnDYiDUm/GrBlex11LugKG3sCgS4RzvBew
X-ME-Proxy: <xmx:dP3WakuJxczIT95aRxLmBbdXQSlRKpjQPwFlbNsi28TJ023c8gShmw>
    <xmx:dP3WavYfc2wZ9_vVeOpGodPx4I0tKMf4qsAGn9zzQP910GGHwxN11A>
    <xmx:dP3WanUdSlAnKmE-SoYeylUDa8DjBVVYlq-zx24E_ObfWqDcuqSa5g>
    <xmx:dP3Waj6UeQE0T-wQ7hLxvJHnv56CSVKyr1O5eoSWOZLweJYYh_33Wg>
    <xmx:dP3WaiiFsCQZha25A35f-5O6ZDd5wyEF43Pma7TldbawWUD_9V1OFAIf>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0F1D6F80090; Tue, 20 Oct 2026 01:34:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 07:34:21 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <0973d140-5d0f-4b6a-8c1c-bd35507f0b5b@app.fastmail.com>
In-Reply-To: <202610200352.nYbO4QTN-lkp@intel.com>
References: <202610200352.nYbO4QTN-lkp@intel.com>
Subject: Re: [ardb:x86-pie-v4 10/22] arch/x86/kernel/kvm.o: warning: objtool:
 __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable instruction
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This does not reproduce with the instructions and the exact same
compiler. Could you please elaborate on how this was tested?


On Tue, 20 Oct 2026, at 03:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git 
> x86-pie-v4
> head:   6a0fa5d8e005033f0d73c2cbabb5e555ea8575d2
> commit: 60aee4318ce34e68540772a2cdb3f57b04d4c9d1 [10/22] x86/kvm: Use 
> RIP-relative addressing
> config: x86_64-randconfig-r2102-20261019 
> (https://download.01.org/0day-ci/archive/20261020/202610200352.nYbO4QTN-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20261020/202610200352.nYbO4QTN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202610200352.nYbO4QTN-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> arch/x86/kernel/kvm.o: warning: objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable instruction
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
