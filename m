Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501051;
	b=SFj7VDUtlEBP3s2Jc5Tl04+sDSiIRRbQeI689HOLvDtipAIPHqhkGJVu9Aqplnz+YC4g
	 bRaguU/0D3uiUoVEP6ZX5Mf1axwUGLEeGjmcaLiyEkASg254gbBs4y8sRJuUAdVVSiuOZ
	 hpRGPZWNW0FUBRArysmyvd7w0GbaaglsVcbWsZw+ju434KAMBCvChQdV2HccmvkLgjJgV
	 dWE2RnmlkVawRotbSwLSR+ijyW+OHwQCnAm0yv/inrqHDxaQcpAszVA3W5gwZdeLMtbFK
	 NG9SXWxR4UpPTOGFKtvaxDcrosi6junpc6+wBrrhsjT57QyTw7O0VCqijbuv2RfZn0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501051;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=2wC+DHpfvhjOngkdTUsTlLEY73HKthsXUYzx3ptaIKs=;
	b=c74RNQqMMroqMUxGEAkl9rlECsIFP5Pkcr4KW0tuLMxFPRjHQFxMWXesAeSySXk1Kk+w
	 YRAH8KtLgM3mBie7C3G/km4mvQDtUDWTwhlnzNx8Ac90OHUi2A6WB6V6f4vslljG/AM6A
	 0Bm41gMytPsM9iFBM830oYdJLIuwEf3xHbvomQ8RTG5dSx5xREZNx/0bhLEGuDqKsKUQ8
	 MNtJkByQcFXdG0o9MfQG/ONdiGUlHum3uO+05i5w26Kr07fsVvwWaAMbICNaDscUnECg9
	 Na/blH8Ff94cpMiyKCD84C8Q7YczZGfV50XUO8YcC+dJHI2/npOHvQlQSWo17C0PbIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=MnSt6P5v;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kIByQjqn;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A28606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 16:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=MnSt6P5v;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kIByQjqn
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id C0A401D00217
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 11:30:49 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 11:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794501048;
	 x=1794587448; bh=2wC+DHpfvhjOngkdTUsTlLEY73HKthsXUYzx3ptaIKs=; b=
	MnSt6P5v3joC+WgwhIXh/N1M3gZjtKe4J6Rg8mkHqObmO61/4ZWokdUu6qnZs/6r
	Axu+saX9rM3nl97b8zzGNbYT8nZymr4DWjBrtuY1dmOEDkUBxJEDytKs31pKiuKa
	+WPyWGEh1YxeAXDMX5Z3e23Jv8tIIMJEaI9P5TGepbAXxMUJlTGDo2aktDTUuZNQ
	PjQzjrc+YNHvLdTEsNcKY2bbAkQbXNfDt+x+8gG6XMezE1nKCdgJc2jvL/aMvbF9
	wJd+051Ig5VLTdHeLfrPUZfJxPuGxG1joCb5+KyfV+OH7A4Yn3BGU4Kg2IzYAEzp
	yk44fQqADYsgCdFs4GtoYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794501048; x=
	1794587448; bh=2wC+DHpfvhjOngkdTUsTlLEY73HKthsXUYzx3ptaIKs=; b=k
	IByQjqnICmGqcMGjcmcuB8MlMN3jacuzhUMi70um6CNBs0oZyLVylGJccbMCp2hO
	UqHvlsR5ylbfLF86P4UvZDzSIGFqicD0/JcmuJh4lrxWIDty5lvurkqX3pwftsG/
	hNc1L5aqit1stP7zNzGytFgd8vhsIwyu3ab+bCr5NF+hAevWytJZ2qEClcPNW42f
	Lf8FSgNenTCmKRHA67yFSCP73VZZzWC5tzkmr8/lyQJPHq/CglJmpDt2epUFCi4H
	HJQrjRsDGTRE17tF5ipGpOQITzV0fCYZlEHOmUw4DKBZFkakckC336OPqQfErGzE
	StPfjpSpFoaQi4j5j28EA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794501048; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PG9lLWtidWlsZC1hbGxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:F0m3ZQJIjD6KXof9a4UtHRWKexT7iGZKXzALSsNuuVkqXGO
	gmokoIuVsPQnkoxMKD+WcgnfdEIFEaCkufWiXJkRrQzPx+SXEAVoeUsUEahjzbOA
	MjLXY7uHc64eSBP2dM68AFAfoHz+BP2L/dx/nG/6uyUh5/Q0pC55NYOuJ3hZ0J/V
	lDU4JCEYGO1GmDmqT+J8wX+yl+49Oy8fWFOdRVndzkvJw4IKdZo4Fq5xitsBLG2E
	ZDyCLZc/1V2yBE54OjZ0jNiHoMNQtV0sQjJaQ4uSuSQ8wgd4lfx+gbZImoKRkegG
	22hLrfjrkyNlExXC5X8cvGo/9XsWkiaIkkCYuQw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Tmp5tBgBP57jVEVYbBl47F5LIEsvDav9g5veU3DBpaw=:93Pw5IM9X04jl9lXmDuAcZ6gbWLkLC2V4uYkny3XtYQ=;
X-ME-Sender: <xms:ten1anWYmP8k7_3-GNaAlKQbY2duV5_yyHugJ1YOxnjn6oSqHSTN4g>
    <xme:ten1aqbbXMrwFTpD_wfQG0iKlbCRXj4fAQvTLc50wauITm_xAf4xt6H-IY-7AUb8B
    q1ZyGaSaFiQbJTeZJYD9U6vqueyp9rDhqIbHvL51hCVejGYWZyxY3Y>
X-ME-Proxy-Cause: dmFkZTEocBj/d8YWT2NbaK+590DeUK9E/Q9DJXtBoorFz5iQKhBgaSBs0k3h2jdf2ky8j1
    EpB4soQ5W0uRiLCQvWE2+BKJWePhlR9ApqT+uDXgmOdA3FBIq4BbThPHnCnWwx33wNy+Vm
    a8Y7pgtnAoV26J3W7koRSgdaBjqHxg1jSzmdUZ5N4ulcC3vQnS55QVhfVQOk+j+dkejCqv
    5Ba74+/aIGDTN7cbPzRtonEoVnqprEZh772UpTR/FPmtlG/7TDcgoFB2OQgyWpfBkYgsJv
    CxwZFPfLVIGj/wDsD0yIj43IM63fsRaykSGICTMLrE5W/YXFPFqINAtjNn7C791NUQ/InU
    hqMNK8JbEa0KJFQfObuLQXtZWxTbBqohHsYCOhphpF5wTIjhs2Y8lwBNlRw/L0ZF7nTGzR
    rYPY5vt/YQgtxf2XaNlDgUSzywP7xfD9HnVHCsaNAcg2plEvfJIRei88dX9fPzkNPWzO/V
    gqnP4VmiyYFqx7POy6IssiCOoWI7S9Ib1SXviYQdQ1Q6574f+UynmkSRqt1AD6wpBy18vk
    1ctZHGEMJIZXjUM/y5sWu+TEbskVOLf9TCjiPt0a18bFTy9QAFYYF5AX2bvzUkW3mqqCDk
    jMjdJhGwYCDwarr8Lvg9FAPU296XyVrmXvcejsGnzu9cHPDT4olpgGVZOJTQ
X-ME-Proxy: <xmx:tun1am4g6Vt1M5-a-s4l5XsiW4fz_G3ZeXOcEG3cvoQLO8-iuwve5A>
    <xmx:tun1agAkX-kXLPS--3uPrT71crgeFq-mkzb9kyveGoAiq3KJz3dnBQ>
    <xmx:tun1atZdrXVc7hg-N_Af2B2ehQDutSN_N4ZdTZzpRqsKJmY9qL23pw>
    <xmx:tun1arb4lVXwI-Dvr7f4V2ICrHdUr1HTuesrTuoLKvkjMzzOonZxkg>
    <xmx:uOn1ajIb9GPBSAFvdRR2KkOTDv9NoVQwv-1vWuseja_i2swQw48RHPmA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7952732A0099; Thu, 12 Nov 2026 11:30:45 -0500 (EST)
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
X-ThreadId: AMahpuQ4Atds
Date: Thu, 12 Nov 2026 17:30:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Message-Id: <ffac8517-468b-4dd6-b354-5e63ed2b40cc@app.fastmail.com>
In-Reply-To: <202611121726.xboRqpix-lkp@intel.com>
References: <202611121726.xboRqpix-lkp@intel.com>
Subject: Re: [arnd-playground:highmem-7.4 5/6] arch/powerpc/mm/init_32.c:49:2: error:
 #error "You must adjust CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 12, 2026, at 17:13, kernel test robot wrote:
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202611121726.xboRqpix-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> arch/powerpc/mm/init_32.c:49:2: error: #error "You must adjust CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"
>     #error "You must adjust CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"
>      ^~~~~

The randconfig file contains

# CONFIG_LOWMEM_SIZE_BOOL is not set
CONFIG_LOWMEM_SIZE=0x80000000
CONFIG_PAGE_OFFSET_BOOL=y
CONFIG_PAGE_OFFSET=0xc0000000
CONFIG_KERNEL_START_BOOL=y
CONFIG_KERNEL_START=0xc0000000

which is an invalid configuration

My patch changed the defaults for both PAGE_OFFSET and LOWMEM_SIZE
in a way that should still work:

 config LOWMEM_SIZE
        hex "Maximum low memory size (in bytes)" if LOWMEM_SIZE_BOOL
-       default "0x30000000"
+       default "0x80000000" if HIGHMEM
+       default "0x40000000"
 
 config PAGE_OFFSET
        hex "Virtual address of memory base" if PAGE_OFFSET_BOOL
-       default "0xc0000000"
+       default "0x70000000" if HIGHMEM
+       default "0xb0000000"

What I'm guessing happened is that the .config file was generated
with the old defaults by running 'make randconfig' on an unpatched
tree, but then running 'make olddefconfig' changes the default
for LOWMEM_SIZE without changing the others.

     Arnd
