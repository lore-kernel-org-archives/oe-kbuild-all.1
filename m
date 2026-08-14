Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905D353A6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741126; cv=none; b=uw03zyBRYOP7aedyAbKHRrdytkadyLrhFIQ0KE0sshqNSFYiZtLX5sifZzlUYTnEIm54dKVljF5TpsvZmnenWEVKJnSGH4Sb67cMNfQ9BucugCM+QknQH67ZeEuqQdbzmuM0GtnhXfuB4mdK1hlaWpsopBwrN24BZQ+rLZjto5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741126; c=relaxed/simple;
	bh=NeRhIX2s70/8YOgHWx7v51s/+2/3G1ev0ujzLTF/mos=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bps3UBYpS3ZMmoMTglrD8+AHO8dE8JpWBAGkhhiQw7aeppHFQJFFTDNCODq6Z/+wxqU4ylIKKcBvQQEHcbqCpskq2VA5ZQzcz+yuKKTW3ekfyCEliTv+NhfBUuMrBadGLppec8iFNYBND6/PPK53Rn4Va7D5v8hplRlaL7fGIuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=idUsXUqC; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="idUsXUqC"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-481558a96e2so787598f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 13:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741123; x=1787345923; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyoIjIfZucHsRYdjMujQvQKd5GmUzCCcE1oyGezxt+A=;
        b=idUsXUqCu3kPrmC0YhKlrygxzMR0bahaldrx1GsxRYlXuGwpMl23D9vJ4XMUAISQFR
         aduHgbt9WnMxMxnxES7ZpuIfUna982JW+slQmDCr6cHbauXi7jlYZO6ZIj1b2UVEFgKK
         HnFFIKdBWUXZC/o+DRHFVZ0Qzu/YOxxD3zlkc/s9O8p9g4kKpUSICu+hEgKVB5kqXuaP
         oRZJuRshmnQcTGod2Fnjkpdbtr6sk2dQJfJMrJxnk3Mwe5iHAIFsVNfFEnFUlFe3s5ed
         ubL79egGypsDJzgM+OpVHFnrZTGkOvKsQcRS3KVePQeZPMjlBlsQZs3w/ZOKWZlZsGAz
         l9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741123; x=1787345923;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyoIjIfZucHsRYdjMujQvQKd5GmUzCCcE1oyGezxt+A=;
        b=fjPaLs+8PYbLU/2VwsjTrnZZ1BBLUpZHmRes0QE3gmJW8Acf5E8DOpMvLPvINcMj1w
         tPq8cISsl/JSq6Niz5fpvJZH2Ks4sk0SlgTlvRwrWiHRtTo7jHF6XAJvfH+2ofdhmXSh
         20QhYr/Jm/fu8o8qXsKH6jfk9nhzMmLSU1UrkYy/7Q71auhRcyV5+Lvv1gfQ/JrvRIKn
         Aht3284i7rMWFduwZPhO2iJFKzoKIQdxwcu5GMeYiuGLJf8B+MtgyrqFVD0io3mSN/oS
         3ZKR167bxxr/WKGNK+xW7poayCpNI0ijz2CUYR2z+C9+cT/WUcxG+w1GWQBydgIRY8RH
         IGbA==
X-Forwarded-Encrypted: i=1; AHgh+Rpzy3IBXA2DhPx3sMKYl1yfselmac/7pptCqQhOzE4gcBimnXrX+CH2D2H9FUDUhOo0865fmYxjm3xfZvPY@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ/h9K7REsxBevog4TYCmKLV7qdAZuzm3pR+FpkgKZrK+Ct+bJ
	G51Vba6AjQt1H3uy4uGXeBN8Pu23x/5QJJsefNYhZFignl5vG9+BVLo5HSG+xqXrzthJPTFp6yN
	wpeN+JP6yVA2gq110HA==
X-Received: from wrbdp18.prod.google.com ([2002:a05:6000:c92:b0:45e:e5ab:ec50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:461b:b0:47f:80ee:744f with SMTP id ffacd0b85a97d-48160799d3fmr14545735f8f.16.1786741123347;
 Fri, 14 Aug 2026 13:58:43 -0700 (PDT)
Date: Fri, 14 Aug 2026 20:58:42 +0000
In-Reply-To: <DKNUE8CVHMBF.2I9WPCF66RLA7@rcpassos.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260731133253.661634-1-rafael@rcpassos.me> <202608102134.Dygd1Kx3-lkp@intel.com>
 <DKNUE8CVHMBF.2I9WPCF66RLA7@rcpassos.me>
Message-ID: <an-Bgkfg6LcbQDGs@google.com>
Subject: Re: [PATCH v2] rust_binder: speed up get_node_debug_info using
 lower_bound iter
From: Alice Ryhl <aliceryhl@google.com>
To: Rafael Passos <rafael@rcpassos.me>
Cc: kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org, 
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	Christian Brauner <brauner@kernel.org>, cmllamas@google.com, oe-kbuild-all@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Jori Koolstra <jkoolstra@xs4all.nl>
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 13, 2026 at 10:15:46AM -0300, Rafael Passos wrote:
> Hi Alice,
> 
> Do you want me to send a v3 with this rustfmt change ?

Yes please make sure your patch passes rustfmt.

Thanks, Alice

> On Mon Aug 10, 2026 at 4:29 PM -03, kernel test robot wrote:
> > ...
> >             {
> >                 let inner = self.inner.lock();
> >                 // cursor_lower_bound retrieves the "key" passed or the next existing larger key
> >    -            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr+1)){
> >    +            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr + 1)) {
> >                     let (_, node) = cursor.current();
> 
> Thanks,
> Rafael Passos
