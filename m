Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40E3F54C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960887; cv=none; b=OD3mjDZYV91KSzIQLPFJXbgD/QAJd5KBrLvOF0Qv9heKCrPkjk+LdL2LH+OmrvMXZrBDdZzZA0yfxnhl5j/g7nwwYGJK98oF2rRgo7LqqdH4/PzNO6cE5Im68iXFSulu0+6OZ96P4qmYRnwaDaOLVSm45HNwtkq0myBmEbNtZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960887; c=relaxed/simple;
	bh=sD9fivjih6d6YvP8jetJUY6MMIif7wajmLU4WtFfQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1vkFBtK6TTi551w4hJTdJ1TGZ7ZxD3Cxqc9G94CLOmU/2JQ1lJtI4ZEsPbiFN+E7KE81p/6ke0bLIruXsTbO6HKC1B6HNgqAE8Jo9eIUpml4VYNLmRTIw3ZygHWcbFKXQBOZXr37XXbQDclNN1GYgkwFusOxnspwm9NfY9jdhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftRY6ZZk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftRY6ZZk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so35429545e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 03:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960876; x=1787565676; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XnhZdf64l5mef5RCreV5vYnxAU+4WJlbu5LfpIob84=;
        b=ftRY6ZZkmBRGb4HWfqf4imP7YO+iDtYn4y0S8L9ZllsGL1YREXEAu3NZ4tWkdHNcex
         K0PPbgVmK5WFDY79jivC+K55pZkiI62xYjvwx+Gnf8LezLAFOcTxAVbX9Kkza41jnT+R
         qKMxE0CINyWrifZktDTa9ohWNTrk5moIz0ZjH0reCFax2Z4PDoscOWwKlcT9Oi4uc6mk
         n5bosG7KK2LTQpNrDIvkgwCi1CY/nbfc/u22scZLml7td6clVcXAQJZuM0cyl8/W8Ecq
         Tu3durNDduOQUU0M1hunfkTfZSyL5LTO3A+KzssjEsX3OWYP9AncRfYiY3z5/nfLrgi8
         cRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960876; x=1787565676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9XnhZdf64l5mef5RCreV5vYnxAU+4WJlbu5LfpIob84=;
        b=JQfaW1ezbadtqh/5sKwZPrPQz5G0rJwaV64GiP6rZvo0qve++T03W53E1ikQl19MJq
         hMYwXiBzUoxD79f6+cOjJlRLgc4QqYNgUbJ0iFHcQmhJEoyPyLA67JAcX1woNhl7f9cy
         Vqhkb9smyeU3qsmxvTEfc+/sFiEtOi6eZC4YtQzcqzLF4KxPBBAnqBvgxFXZikcspdVC
         Fjcf0TgLu44pEkDnDRdjswoeUl73BhrXgPjqh/Q5R+mIkyioTMMAR+/H9v/WPYZ6Egi+
         MLBRK98wNiuN+q1iL5a+8bMFn8+sMnyANmLAzsnZB9x1JVHOD/MDpqYrrn/5xULdoigt
         JHLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpGofTxLd4sal/ONUGLkUhp9+/IcTr1tBcJ+uenFC+duXxASDNGzfO7+mk5qzrZgJNRHmSjXOj9M+HRTce@lists.linux.dev
X-Gm-Message-State: AOJu0YxWrPLF4HJOTj2E+CgXj/opQ8OwBlpKdAm/uO9W0MZb3v4alzrA
	LcCGqe2Ia7wlQTKiC03VbRRFYs/GWH2dEHpMilbFlMAN5UmNO1XmM00z
X-Gm-Gg: AR+sD12CMRTw3Ysi28CcPEoDA/18yYPg840LZA7Qc5LJU0MpKdmjvKGq1eqXPE7Isvu
	SqwtxWw3xRPzuac0BH9ayAFksZkCSOCAbhYG/KRNyI0lddl6rJWIv7qoGR7ZSjbuVSDgxMjNPal
	W/+5vBVZQYF8LIGmxMqxiI7AauUaOk6jwq9CtlaT+530g2WQbRLdftKusfhsAzAhFZeoR4fFnZv
	cOwR3jdQ84rtYdCfJPZHL/U3nz/y04V0AhTP5QHD5GmqSsNxDhcnnEsW7wPBJxgtx2xE2upj298
	H/wkbvqBQhiuofLvHG4xf/VZuzzJIsV7G0NVjsR+mjuJQJWkvqq9W+Iv7NnN9QlggJXE7Q5WAQI
	KBlBHUkLQu4ft6e8QSzEgu+7k/EG2jEgFpldYcT0agOI09FNfIHfEtcvF6qJTE+JRTvUqtOU6MY
	l0Xt9U/6TJFht9MAci70LjMsx9eUJvWAQ/+TkTZh5w/3wXCygqwMde7NEfR0fmY3UZCIpunG/ys
	vARbwXD4EGaq31XZBHG4JptEjEdRKnl+a8P
X-Received: by 2002:a05:600c:528d:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-499900c9e99mr240828505e9.9.1786960875443;
        Mon, 17 Aug 2026 03:01:15 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d063a68sm25137585e9.2.2026.08.17.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:01:15 -0700 (PDT)
Date: Mon, 17 Aug 2026 12:01:13 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [bpf-next:master 2/5] net/core/bpf_ksock.c:221:18: sparse:
 sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be
 static?
Message-ID: <aoLb6bqvF6tA-riG@gmail.com>
References: <202608171256.McaD8rfl-lkp@intel.com>
 <aoLTELXtjRC_SEcg@gmail.com>
 <cd082ee1-efde-4cbe-b8f5-00d8aa2d072b@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd082ee1-efde-4cbe-b8f5-00d8aa2d072b@linux.dev>

On Mon, Aug 17, 2026 at 05:39:52PM +0800, Jiayuan Chen wrote:
> 
> On 8/17/26 5:23 PM, Mahe Tardy wrote:
> > On Mon, Aug 17, 2026 at 12:36:48PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > > head:   c93cbdb13f995f87b5356329b3fe551c80bb482d
> > > commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 [2/5] bpf: Add ksock kfuncs
> > > config: nios2-randconfig-r112-20260817 (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/config)
> > > compiler: nios2-linux-gcc (GCC) 11.5.0
> > > sparse: v0.6.5-rc1
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171256.McaD8rfl-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202608171256.McaD8rfl-lkp@intel.com/
> > > 
> > > sparse warnings: (new ones prefixed by >>)
> > > > > net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?
> > I'll add the 'static', it seems to make sense. I mostly copied this from
> > all the others examples with release_dtor functions which don't have
> > them but it seems for no good reason.
> 
> 
> I think we do not need 'static' actually, just like the doc says
> 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/Documentation/bpf/kfuncs.rst#n356
> 
> 
>     Note that kfuncs must not be declared ``static``. A kfunc can be called
> from a
>     BPF program ``*.c`` file outside the compilation unit that defines it,
> so its
>     externally visible name must remain available for BTF ID lookup.
> ``static``
>     linkage allows the compiler to rename the function, which can break this
>     BTF-based kfunc resolution. Further note that sparse may warn that an
> otherwise
>     unreferenced kfunc should be static. Such warnings should be ignored for
> kfunc
>     definitions.
> 
> 

Ah thanks for pointing that documentation, indeed I was looking at
examples of "__bpf_kfunc static" in the kernel code but it seems those
things are actually outdated and the paragraph you mention is up to date
since added last month[^1].

I assumed that since it was some kind of internal kfunc for the BPF
infra it would be okay but no, it still needs a stable name to resolves
the destructor´s address through kallsyms from the named retrieve via
the BTF id in btf_parse_kptr().

[^1]: https://lore.kernel.org/all/20260626172026.7327-1-jp.kobryn@linux.dev/

> 
> 
> > > vim +/bpf_ksock_release_dtor +221 net/core/bpf_ksock.c
> > > 
> > >     220	
> > >   > 221	__bpf_kfunc void bpf_ksock_release_dtor(void *ks)
> > >     222	{
> > >     223		bpf_ksock_release(ks);
> > >     224	}
> > >     225	CFI_NOSEAL(bpf_ksock_release_dtor);
> > >     226	
> > > 
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
