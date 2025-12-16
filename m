Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486B2BEFF1;
	Tue, 16 Dec 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765925847; cv=none; b=h5ThGGWnXqI3xNmBdNa1Jj3t4efWYRlTJz5yB1SyxqsParusbLoJw1C4udEiz7gpmkBSgTwlTEbugPNv18rBLjzsB15AHyDwnNdeqxBKyh9MX09mQ/2Qc9JL7nXqwQRovDPtfJ+no6PCigVDQIOCPwYqRhOu39YRcTLdEK2lXWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765925847; c=relaxed/simple;
	bh=1lQmpbTV4/D4X+w9NoNtOsMud/kc6C9+FIv9gu1F39w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i27ufOM/NTC9B3s5UlYafdtwUf6yLmC2+OFfWQi1SUNAmE0Tg+b/RvWKkamLfhYdnGdGO3O/WR63SNRUaAbAt9aFiTQpJt14JFUWwMtDHEStYw4AUhw9tx1MiFGXHOUyNJLiwCw37LkIPMb8sBctZcOlaUa5dt1Bh1/NbJLUr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNJzDIMT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNJzDIMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FB2C4CEF1;
	Tue, 16 Dec 2025 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765925847;
	bh=1lQmpbTV4/D4X+w9NoNtOsMud/kc6C9+FIv9gu1F39w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNJzDIMT2XAS5iHIGUK9qxMp4uOPqgdTqtfpfS7fumF7Cn8zr6wlC9PKsarnPO/qA
	 UN4RTvkZWQFK8ln5kfE7/Wm0t7P0zhOJExs3Ac5mpOhP/GsuMUAGqQ76MhMHnh9jzK
	 F1woVAj86fsDKIO78Im5z0nqjorksjLMcXtAk2lyrQ84SRyHCCfWpQxxj1VZOBAs8K
	 6XEsL8Icnq5F1GUBx6X1Qb5jXjibd4emHiKbnYcTyw3dvBnz+4d//QPb7D/ec7UiiX
	 OLeByPbRsRfa69RzlIvkn9xADBqzniWyHjR5pQpu72fW9VojpTU5cmdOMB7kOfTh4R
	 ZNx0xDLJJP8eA==
Message-ID: <0947502d-96e3-4179-ae48-603de74dc7b3@kernel.org>
Date: Tue, 16 Dec 2025 23:57:14 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>,
 kernel test robot <lkp@intel.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org,
 mchauras@linux.ibm.com, thuth@redhat.com, sshegde@linux.ibm.com,
 charlie@rivosinc.com, macro@orcam.me.uk, akpm@linux-foundation.org,
 ldv@strace.io, deller@gmx.de, ankur.a.arora@oracle.com,
 segher@kernel.crashing.org, tglx@linutronix.de,
 thomas.weissschuh@linutronix.de, peterz@infradead.org,
 menglong8.dong@gmail.com, bigeasy@linutronix.de, namcao@linutronix.de,
 mingo@kernel.org, atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <20251214130245.43664-9-mkchauras@linux.ibm.com>
 <202512160453.iO9WNjrm-lkp@intel.com>
 <4ajwe2mjxijqffbmsf7drav53wxucd7wnrcn7uuvbacrmc22je@2c32xx4oopwn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <4ajwe2mjxijqffbmsf7drav53wxucd7wnrcn7uuvbacrmc22je@2c32xx4oopwn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 16/12/2025 à 16:08, Mukesh Kumar Chaurasiya a écrit :
> On Tue, Dec 16, 2025 at 04:27:55AM +0800, kernel test robot wrote:
>> Hi Mukesh,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on powerpc/next]
>> [also build test ERROR on powerpc/fixes linus/master v6.19-rc1 next-20251215]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch%23_base_tree_information&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945174972177%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=4sU795uiAIkzbbf9cdzEUNH6Cbax3kPS7biPFWiZir4%3D&reserved=0]
>>
>> url:    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FMukesh-Kumar-Chaurasiya%2Fpowerpc-rename-arch_irq_disabled_regs%2F20251214-210813&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945174996572%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=BalspVN%2FJmi2pKv2QsOwMPsPOzLF%2FGAfSJ4Pq1jn%2BeM%3D&reserved=0
>> base:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945175289139%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=IExs1jOXw207ewNfCHIbLYmCeYTPGr65giviQ842JnA%3D&reserved=0 next
>> patch link:    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20251214130245.43664-9-mkchauras%2540linux.ibm.com&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945175311233%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=CJQevooFK2LY06NmPMpnyki3UfYOsIiFv1FThGk4CEI%3D&reserved=0
>> patch subject: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
>> config: powerpc-randconfig-001-20251215 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20251216%2F202512160453.iO9WNjrm-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945175328057%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=fM7XuG4aUtdsKuVZCjXZazYE%2FLU5uhqtXOTsiHQgEz0%3D&reserved=0)
>> compiler: powerpc-linux-gcc (GCC) 9.5.0
>> reproduce (this is a W=1 build): (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20251216%2F202512160453.iO9WNjrm-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945175343707%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pnqJzh3vwyq8XCtopm%2ByJm0zUpz1Bk5JzVork9mZyec%3D&reserved=0)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202512160453.iO9WNjrm-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C181ba96509e54904228908de3cb4fa09%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639014945175359094%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=5ToZM5JVO5d4NhuwFJjg78Xv%2F5nmxX8ZUhfmCNDo2hg%3D&reserved=0
>>
> I tried this with gcc 9.4 and gcc 14. I am not able to reproduce this.
> Will investigate further, meanwhile if anyone has any ideas that can help it would be great.

I was able to reproduce it with gcc 9.5

Seems to be related to commit 69d4c0d32186 ("entry, kasan, x86: Disallow 
overriding mem*() functions")

Which is in contradiction with commit 26deb04342e3 ("powerpc: prepare 
string/mem functions for KASAN")

Christophe

