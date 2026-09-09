Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E7F38E8D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940069; cv=none; b=ER5M3WrbPmm7dungA3k2SHHSWyvyWrK8j3UvG1yMt8T3QBF6pcIhHeM6abj/Ypg93D7berh67ukNISGYsCvahAVOLljDSnkedICOmwLGnSvimuv0plPQ/cbOb10yoy+fon1t3xWc0RzY2o/fCHvZ38r3SJbGFAary2gm4LHojTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940069; c=relaxed/simple;
	bh=emjg99APSmqGdWpWlD1HyAtwcVZtvDaOfPyO+5nf75c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=I9UzcukEGK/61kgEYLZWQvDtgazZk8P7tOo5Udv9XKYh6pkdrSdLkOJu8b3PvPxDVjn8io/L68wS8im3XHiMToBpTgquzscgc7gQfa+MiBDBe46HSL/JqXm3bSmkLeEqM7yWZgLOMFnb+MHFBYU0PqYCEZF+tnocOLfszuQ9y6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqZbHCbW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqZbHCbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5991F00A3A;
	Wed,  9 Sep 2026 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940068;
	bh=X1tRcrg2qpCTvGtv+Ku98ubiHqCpraiTZgjOmCyv184=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=AqZbHCbWQgXZmq/FwMFdrSpKjg/1lLgzPsBHXBTja5JQg9OquNPKlE+oy9dREdRTh
	 40PGtc8O9VR2WkWtI84rOsBqC4gzQ7G+B7c5LB79ShK+8Ptsrx2YOJVWqXCxNJAdx9
	 2O+bnqkx/QAKS9GADAPNwcUVxiS0BuwztskY2OZ1VCJdHvR2/WBA+BHrVSswpNo0TQ
	 BHePI7//d+Rl1JpFtF74eozz9ewHfZnDvrrfxmdlA+DfyxpviPNvXtUEyiNXGBd1cA
	 MatnIfpF6dI99zVcHR1Ou0iCG4oN0bpjT+jeOGDk9YpWMU2Qe35tbSNAbXmIHahSg4
	 W6r950j7ssP9w==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 446A8198003A;
	Wed,  9 Sep 2026 03:47:46 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 09 Sep 2026 03:47:46 -0400
X-ME-Sender: <xms:IQ-haj8d52S39yHDUgeJOnzMUZM_L9sDrhyWtbZYJvbJ0gbLs-9FyA>
    <xme:IQ-haqjhUA5aONfGotdYKF86OmpFinA78vZazMezmQsCEtS-97ykyvAESP2JHVWKu
    g2m54ycALtBQHVqeTHjfHYJPMdNO7HYThwXAg3aU99bXC_KUbfp04RJ>
X-ME-Proxy-Cause: dmFkZTE4RYSelvlUnz06MK4aNJd7/rM7q+KOo+lNvz3NtITFCR7t/aeP2s5ObVf/9BH210
    le6WaUcdcOZeCf5M+qL6yo1pZ8ariaPoRSEG9K8Uzbd8JBBdVEzH9u8o0SFuieVcjhE8xU
    benjBF2JAv8dyWu0vvj9oLZls0xUJY32ZyrNvPSsCI5694k3/8RkZpaptu1QV44sMDn07o
    rDmw1CG1cnDHE5p8RDT0EW4QNkaSw2BS5RMpKvadmdC+gKWAIwMTYLiarT8ZEDmpiS5nUW
    IHMFsBJwtwFVw3dSewgRpRxEOcXL0gNBkSZsgAIYwzYQUrUYZZbgP9opxu6tOlSiTTkyEy
    Vi+ABoQifh/l71uLti6byi0tG/39yLy3xNk2nFhpLi7EDdcvO99hUqICmlr7QGkvMkyZ0G
    in/0SBCVsZV5Sztz0v35lUCpAcuGQ0AUyp4l4LkahOoWVwrqtRHrJeioUlhUsOjiLnAAoX
    AFxM8c/TmRGT/41mx6uheZF1uUwshcIhV7dIgE3uF0ML31tRB+3ZA3rOW2EhcZF7Z0H06v
    HtwBfbRKpKZieVjLmRjzKbPMmSycf8CukqfQzSD9dJJ1R0GR8yjRMPGPeZaOxUoPtdAmos
    Gs5TZEzyZtsexJAsGp+cicQA3u6ZhnyxRXDhw9Y4Fkx4/SexbONpiH3h1k3A
X-ME-Proxy: <xmx:Ig-hal5YIHFcF3mTFKP3oinR8stmdGUhhjYP1YetHqDy9O597xMCsg>
    <xmx:Ig-haqqXnB3iJiSdS6b087mwmTC74JGw-1opsBSSZiVNUwyoJ2YvjQ>
    <xmx:Ig-havjKCPNLdLibuJmTjNpdVLOYaMrTZ0c8p-tCcsFkQT7LtuEMKw>
    <xmx:Ig-hasK8SphAlLl41j1zDRObVMOPZ5Mln3okmgYVqJ1uUfauGR-C0Q>
    <xmx:Ig-hanC0E6rA_4Dp_vYAV3rbVsnAXkyUi8fy9Mq_j0-NjhHvyb4C2Yvw>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3CE67F8007D; Wed,  9 Sep 2026 03:47:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 09:47:24 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Philip Li" <philip.li@intel.com>
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Message-Id: <b4c98aef-91b8-4410-9b38-82d4aab5b783@app.fastmail.com>
In-Reply-To: <aqEOd9SJ8La6wcd8@rli9-mobl>
References: <202609090804.938npPl7-lkp@intel.com>
 <7b9400d4-ebf4-4757-81ce-9e52295cecf4@app.fastmail.com>
 <aqEOd9SJ8La6wcd8@rli9-mobl>
Subject: Re: drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous
 prototype for function 'efi_snprintf'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 9 Sep 2026, at 09:44, Philip Li wrote:
> On Wed, Sep 09, 2026 at 09:12:46AM +0200, Ard Biesheuvel wrote:
>> Please stop spamming me with reports about code that appeared
>> on one of my branches for a brief period, was apparently pulled
>> into some intel LKP branch but was never submitted by me for any
>> kind of review.
>
> Sorry for the spam, I will configure the bot to avoid sending such
> report.
>

Thank you Philip.


>> 
>> Thanks.
>> 
>> 
>> On Wed, 9 Sep 2026, at 09:00, kernel test robot wrote:
>> > tree:   
>> > https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-boot-Drop-pointless-re-implementation-of-panic/20260906-150819
>> > head:   c551ec0edb0b057c415d5530905c288523a9bde8
>> > commit: c551ec0edb0b057c415d5530905c288523a9bde8 efi/libstub: Add 
>> > efi_snprintf() to construct wide strings
>> > date:   3 days ago
>> > config: loongarch-allyesconfig 
>> > (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/config)
>> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project 
>> > ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
>> > reproduce (this is a W=1 build): 
>> > (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new 
>> > version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: 
>> > https://lore.kernel.org/oe-kbuild-all/202609090804.938npPl7-lkp@intel.com/
>> >
>> > All warnings (new ones prefixed by >>):
>> >
>> >    drivers/firmware/efi/libstub/vsprintf.c:274:5: warning: no previous 
>> > prototype for function 'efi_vsnprintf' [-Wmissing-prototypes]
>> >      274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char 
>> > *fmt, va_list ap,
>> >          |     ^
>> >    drivers/firmware/efi/libstub/vsprintf.c:274:1: note: declare 
>> > 'static' if the function is not intended to be used outside of this 
>> > translation unit
>> >      274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char 
>> > *fmt, va_list ap,
>> >          | ^
>> >          | static 
>> >>> drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous prototype for function 'efi_snprintf' [-Wmissing-prototypes]
>> >      511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char 
>> > *fmt, ...)
>> >          |     ^
>> >    drivers/firmware/efi/libstub/vsprintf.c:511:1: note: declare 
>> > 'static' if the function is not intended to be used outside of this 
>> > translation unit
>> >      511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char 
>> > *fmt, ...)
>> >          | ^
>> >          | static 
>> >    2 warnings generated.
>> >
>> >
>> > vim +/efi_snprintf +511 drivers/firmware/efi/libstub/vsprintf.c
>> >
>> >    510	
>> >  > 511	int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)
>> >
>> > --
>> > 0-DAY CI Kernel Test Service
>> > https://github.com/intel/lkp-tests/wiki
>>
