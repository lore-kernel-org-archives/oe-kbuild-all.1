Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D529A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352755; cv=none; b=tUbm8eyTf/g6flmYvuUDwfAEdH9jadw5A4CXcwhcJeamCqbfGJrKAOJXUEBQ1o+xtpx8Np8lerrWxmMx4AHOA56t745guLNEXZHx/HhsFruBi2n5tTYUL9LaKifb2wTNI2lVg+r+yqp1ds28eUCepTXNUIiPFXjFmxO32vMkyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352755; c=relaxed/simple;
	bh=0kiUXaTZG9XfxMhm0+X8mOo7eWN4gVxGbG1FQ98Db90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BAx5Tq6Uq3gJr4WaRemzfqw0woet50OQgAQk4WSQP4WO5cgy2p18ljWnkplmQKp5iKWjkXxR2dH6DNDaSxvRUE252Pg1mWznMwgM+/ucFp6+hLKuki9HmzXR5sIv4WnconVpfMbU4PNj0nMD+QPmK83nQV4hrR5VwnXpBXOxnVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fssh8/yL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fssh8/yL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AA591418B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1722352746; bh=g/gjRalHFRsVoIZ8WYQD16VYmKi/y2TadumZxDaPaZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fssh8/yLRU+DCg+Ndg9Om20C5HbUe6Od+eQmTzbcGtSSCTIzf6wyQccggKOFMjKY8
	 L2jpS5Ksv13QoBxQXdBuMF5xSf8ceTv1RqxidYYKsBNM2Wfvt2EaNhMKMSK+1z7c0C
	 gofh3Pvqc8XE5dIsfpyLgYmjpdGCcGxFMBYfJC3OzBzMSYP1LRDJhvoGezGmT/EUxr
	 xVJDRTp8fTbzOYKXTIa2cVpmfyb/Dz8XoefLVd2cLsH3h5yzDa//rgiknng+nF6Val
	 Ikz70cnV4zUZJWgYa5Q3SSUM6Q8ANM6irio2aEWeXPHshiSftxgGeKkrpB/kxBSLBd
	 LHYXceaHtBwqQ==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AA591418B2;
	Tue, 30 Jul 2024 15:19:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <mudongliangabcd@gmail.com>, kernel test robot <lkp@intel.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, Yanteng Si
 <siyanteng@loongson.cn>
Subject: Re: [lwn:docs-next 2/8] htmldocs: Warning:
 Documentation/translations/zh_CN/kbuild/index.rst references a file that
 doesn't exist: Documentation/kbuild/index
In-Reply-To: <CAD-N9QW=6CbbzM4G_hoB-boMazDR5MGm6D3thPe6y=F05cNdJg@mail.gmail.com>
References: <202407300812.1VvDFdxD-lkp@intel.com>
 <CAD-N9QW=6CbbzM4G_hoB-boMazDR5MGm6D3thPe6y=F05cNdJg@mail.gmail.com>
Date: Tue, 30 Jul 2024 09:19:05 -0600
Message-ID: <87bk2e9ac6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dongliang Mu <mudongliangabcd@gmail.com> writes:

> On Tue, Jul 30, 2024 at 8:59=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
>>
>> tree:   git://git.lwn.net/linux.git docs-next
>> head:   60666fbc81ac91af2cf2f511d60859288f7ea8e5
>> commit: e6a5af90f0a24f08445e3b8a11b727ac84a9520c [2/8] docs/zh_CN: add t=
he translation of kbuild/headers_install.rst
>> reproduce: (https://download.01.org/0day-ci/archive/20240730/20240730081=
2.1VvDFdxD-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407300812.1VvDFdxD-lk=
p@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt re=
ferences a file that doesn't exist: Documentation/devicetree/bindings/input=
/qcom,pm8xxx-keypad.txt
>>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5=
703-regulator.yaml references a file that doesn't exist: Documentation/devi=
cetree/bindings/mfd/siliconmitus,sm5703.yaml
>>    Warning: Documentation/hwmon/g762.rst references a file that doesn't =
exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> >> Warning: Documentation/translations/zh_CN/kbuild/index.rst references=
 a file that doesn't exist: Documentation/kbuild/index
>
> This is my problem.
>
> But curious: why does my local `make htmldocs` not report this issue?
> I tested it locally again, but no such warning is reported.

I'm guessing they are running scripts/documentation-file-ref-check.  I
should probably do that more regularly myself...

jon
