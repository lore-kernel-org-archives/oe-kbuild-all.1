Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EB350A0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 21:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341493; cv=none; b=hTBGFBzUBmYGZdCpDiybUDhXvw1P6ZwU0wM6Q5zVs1XhUoGSwj0OKGCbe2XUaoggqgLGvSIGH9FSoRIHMub/nkP9yHZGvrafxmGSWczina/LIzdlNrawg+y8RD0qihG7tKxpTPFbsXKJb4SyLM3cc0bejrBHfflp6yMDNjrchIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341493; c=relaxed/simple;
	bh=0ttUuD9yelTRfCEzlEO4mLlzeT+izPzbeZ2mAMeg75I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvG86F6VsVt2lwHTD7+YCrE1HbYFV5PMxeJYLYoE6gTNEXTe8b4IcLsSs9/BeezI+S2AQBhmErYoFKE9bY/+AP+e1Ds68nd2iD9NXXafPW2PpGsnIh5XgxRRFIb0iXuD2CJRg4BroKMqJBmjEdhi/rbNM3VnUhvOkVexB9EsTrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJXk7DeC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJXk7DeC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so60073705e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768341490; x=1768946290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjQpoKoi4pzTkbGscUXDmca2AVl+LBzlv/bdYvtEAK0=;
        b=IJXk7DeCBvf7rjsmbFfLNrKh3qhec01orXP/rG40xWX4DgecKK1l8Wigo2hpMDNZBs
         U1KI45OsZtuIXun9hdPIjrQ7n1OIzogZf5NFWaPZNPRtv6smVo5pFuareGFXCLiF99FT
         i3t9BumJOXU0dDlJ1ItDHKyu1ushCP/V7cRLC/uITnrLq6gOSBXAMlbWBeSIOSNbcBUY
         ry5j7L40ES3tifs/3JgbRyZ/nNSsTDsp8wxmd+SZiqi/qqQ0MoW9OhhktNSnswRlWOEY
         wxuMoWWAW7uqqaQvmdEHuX44o/SMMzETZnmMngTQn/LjKROJj6a6GoxZ3dhXHNtd64Qs
         DR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768341490; x=1768946290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjQpoKoi4pzTkbGscUXDmca2AVl+LBzlv/bdYvtEAK0=;
        b=KE/yj4YxjFqTB1somPl8MLlyBAQRV/LaZBAiEFs4p6mTHVEtXXwAEmSNy23PmBKY0g
         nvFSQ6w142uA3ogGszIbpI1cNf1kzuPABPYTSZkyTVeQe+q0xGhDMu0p0aXNSTlOISgl
         aRKcftsBRefLI7Sn7vR2tnzd+d76inRDHVT8u3Oqd5PrqwcBWWT4wO26Xul+Mk5SMplY
         ioI2nIjg5k+05qcU9OlMxxdpjct6m28+6FN5w6qcM+y0CPjlj9OkPuCEghjoTaNgrJ+Z
         mn4GbfOM16rfVg06CSoXBp2LiSkEsld2y0ZxbloDTLTfG7mfDTFdDkbgetNm6mCLZ33w
         nY+A==
X-Gm-Message-State: AOJu0YzKDAdXVw7BW68wJh3HJg3ZwY+37QVy48/hvT/sSZgS7TZWzA90
	dlzY/XUN2+3FHLbtXbiLw2uRNYLxaftfO9evMDxmw/TRYsTFVxqfYU7G
X-Gm-Gg: AY/fxX79sP+YpzPIn3Ximi4DnkTN7DpQrsmzZISMNn9PJdDO2vD2plVZPTTGdvFVF54
	MJMZrDMnt/Aj6Ril+N7iL/3krJokSc23sF2fbGyuxhTZGLOQDvGjCwB3ZEhoBecdfDoeRvlB9PZ
	T20LdkNxBKXtS9JC3MOrZ8uJ9D3Ti1J7Li2BF1Cf0i3URrOFAtTEUv4d8oV/990+sNYvZL6LLPQ
	MraVfqbXHsppLlFF9JpJTqwXQGir3uUtaZeLwI2hZFKBocYKM5utSxpSwNSj76vIVXyMlNyykwj
	hITyNFsV+eUWQIdpzoMdyYA1M0VkWDiTZiydu6ailNv2NhGfG/tIaUlG+X1qf/Te7mFNkVqi0/C
	YQ4k3j/UCiy2I8qFgz30K1Ol7l+e1h1ejd7HX3OBrGVBIrLePqIQoxWlTksNKQrFreRyxevRR8B
	3kPJNvfWIUCa8oLaMnpH27hMLDwwZ5ymclAJ//K5ZJlbVZKk5Z6bVI
X-Received: by 2002:a05:600c:3487:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47ee47bbe36mr467055e9.1.1768341489984;
        Tue, 13 Jan 2026 13:58:09 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0bb3383sm8819575e9.2.2026.01.13.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:58:09 -0800 (PST)
Date: Tue, 13 Jan 2026 21:58:08 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Nicolas Pitre <npitre@baylibre.com>,
 linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260113215808.135dc8b6@pumpkin>
In-Reply-To: <20260113200455.3dffe121@pumpkin>
References: <202601140146.hMLODc6v-lkp@intel.com>
	<20260113200455.3dffe121@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jan 2026 20:04:55 +0000
David Laight <david.laight.linux@gmail.com> wrote:

Resend fixing Thomas's email

> On Wed, 14 Jan 2026 01:59:24 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> > commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
> > date:   8 weeks ago
> > config: mips-randconfig-r113-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/config)
> > compiler: mips64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> >    div64.c:(.text+0x84): undefined reference to `__multi3'  
> > >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'    
> >   
> 
> This looks like a bug in the mips 'port'.
> arch/mips/lib/multi3.c has the comment:
> 
> /*
>  * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
>  * that specific case only we implement that intrinsic here.
>  *
>  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
>  */
> #if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
> 
> So this code is excluded for gcc 8.5 but the compiler is generating the call.
> 
> Looking at the git log for that file there is a comment that includes:
> 	"we wouldn't expect any calls to __multi3 to be generated from
> 	 kernel code".
> Not true....
> Not sure why the link didn't fail before though, something subtle must
> have changed.
> 
> I think the fix is just to remove the gcc version check.
> The code itself just adds the results of four multiply instructions together.
> 
> 	David

