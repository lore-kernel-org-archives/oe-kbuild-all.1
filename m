Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2050304BCB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 17:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780163455; cv=none; b=HiSHIjCEBoNbvrmbJg4JEM/EkZfqdX46Qqw9pbQipBbSH3nIfAvKCYyOBG0DqvpVPu9KWA4EbvJgFC+NefXXGmIONoTdrZURPszVKysdJexFScjYtwHdvAqBUIHbJIihJ8TwvJi729qP+Y++QGlWsOkGSe0j+Ao/t6BWFr/yGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780163455; c=relaxed/simple;
	bh=GaVlv3GPs0IMGz8hAgJQyN+0Do94PNieO3eneGatlG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsH4EXLfSg2jh9pjleTcHdcFc4tUv5oBrHHznTp3c69Vmn0DS3tQ9KF5ratnMg81Gv88VJeqR02jaVIXpr8yVwAv3FOSPgQ1dwVP6kciyeXrspbO6Wj3YvUgK32keQ+hsispalhXZqjhJNMUEG8WKO6AqB2nCxS/pJUV346+jdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K/bDReHH; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K/bDReHH"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gSSSM6j8Xz9tf8;
	Sat, 30 May 2026 19:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780163444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jKHuR7kgRB1wn/s/194XHELOUv8teEXVzBIWxuLZPw=;
	b=K/bDReHH8Q2rfEZQaVUnFDu7wou1UuZMIRw+FKDYSqCUkb0XCWvrIb5n//DtEYcOpWcn2b
	UWlGTeqPRCJn7uDaqGvislQt5uur+SCoJEkcdbJrAynWv+l3zgPjdpP3zroWTdzS01fY9Q
	mxknvS/9jg5/cg3j/n5R+oQtJ0DVE4nMFGCEZiSMAwPTBlKVtOGjcwuE45SRc86hVr1kGx
	VjauxNYxn48V02cSnJSsyr4ilXfgDpUAo+DwOnCP57SjbISr4sz6kkjzfn1XiDED86PV8+
	gk2rwC88ZIDhoNS9dHMUqtyOMozizE0QlMixyvQBZ3Gcg5iDdHgeBqsXGet44g==
Message-ID: <ad2ea981-34b2-43b6-a59f-af85f68a65d4@mailbox.org>
Date: Sat, 30 May 2026 19:50:41 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 7314/9870]
 arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f
 (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of
 ['cirrus,cs2000-cp']
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, oe-kbuild-all@lists.linux.dev
References: <202605300905.msiJHWF3-lkp@intel.com>
 <09db37b5-808e-44c4-ae41-ff9594e39c4b@mailbox.org>
 <CAMuHMdUgMDPiRUJwOUv0Tab_D5qhQumChhN1288tTtXeqTLz7Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUgMDPiRUJwOUv0Tab_D5qhQumChhN1288tTtXeqTLz7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2d2e3e2f82e63e0d750
X-MBO-RS-META: e3ab9ueroecmf63iyn7z1aaqdp3m6fyw

On 5/30/26 7:37 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, 30 May 2026 at 17:33, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 5/30/26 10:02 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   7da7f07112610a520567421dd2ffcb51beaefbcc
>>> commit: a3dcb0a3204f75f6841d8f7d0dc232f51706dfb9 [7314/9870] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist
>>> config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/config)
>>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>>> dtschema: 2026.5.dev9+gdf9ad30c5
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202605300905.msiJHWF3-lkp@intel.com/
>>>
>>> dtcheck warnings: (new ones prefixed by >>)
>>>>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of ['cirrus,cs2000-cp']
>>>        from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
>>>>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp'] is too long
>>>        from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
>>>>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: /soc/i2c@e6510000/clock-controller@4f: failed to match any schema with compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp']
>>>      arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: mmc@ee100000 (renesas,sdhi-r8a779md): compatible: 'oneOf' conditional failed, one must be fixed:
> 
>> Geert, could you please pick up:
>>
>> [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
>>
>> Or would you prefer me to send it separately as V3 ?
> 
> Oh, I missed that sboyd provided his ack; I thought he was gonna take it.
> I will add it tomorrow...
Thank you for your help !
