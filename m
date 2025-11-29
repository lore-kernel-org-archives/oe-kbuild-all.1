Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA17258EFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 23:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764460343; cv=none; b=ZJlymt0ALgIEWFETRdew5gUxzCBRnp15SBYRyf4HbZtpPY9kryQg2sM9JVO+ZWXVwRYI1UybwthffOFl3co4hRudIPmu3W/UYxPa8yiKGP8o6Q6SnfAO2SU7yr4E5VNcn71uDjRBJuEiqzeNzY0Zvdb6U+jR5ihpjVldL17kAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764460343; c=relaxed/simple;
	bh=qVPWlVjvpb0UuzT37RNPqMRwPxLGb10vEoArGeVrm+M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u/6mA6ZX3NcI4pOEOo0h2UoQy1ev1DeTzZVp0faLEjGzL8OqTNPoShRxcK1DItThBH5eyKMN6ZfFVYucN0eIepKbmMiqbC7+AA2FlHBR52Wx/Mdz6F4sLWKq1evRBdOjsV5a+fFUChNhsB+Flk2TsCiCLsz86yWd8Icpr2QsbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hSjXDZj+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hSjXDZj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235C0C4CEF7;
	Sat, 29 Nov 2025 23:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764460342;
	bh=qVPWlVjvpb0UuzT37RNPqMRwPxLGb10vEoArGeVrm+M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hSjXDZj+qlpkPD4xcMBERy+q8lNcf0KWi4bJNb6mni/AAdG5mh5nLiJ2C/ewkE8o4
	 IFVsba9646eWevC6hTF2UhItCD4lM74Ut2NwvSyLwsL7p+Bxoll9P5eCXyOi4t3nzI
	 VM5F58L16lzvNylU7SMsMaRTXNp5COWZdKpoSS0I=
Date: Sat, 29 Nov 2025 15:52:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [linux-next:master 12118/12398]
 kernel/liveupdate/luo_core.c:402 luo_ioctl() warn: unsigned 'nr' is never
 less than zero.
Message-Id: <20251129155221.d5f3c519747d8d492aa17462@linux-foundation.org>
In-Reply-To: <CA+CK2bBJmj3nK4QhAC5pr+5nS0vRv_5cOxAr_mohC+YreiZPcg@mail.gmail.com>
References: <202511280300.6pvBmXUS-lkp@intel.com>
	<CA+CK2bCmp4gjpyND2=Chdz-EfRAF20unYzO2dwQb+ZTEihgk3w@mail.gmail.com>
	<20251129120040.fb60e8a35d54d66c0bdbdf33@linux-foundation.org>
	<CA+CK2bBJmj3nK4QhAC5pr+5nS0vRv_5cOxAr_mohC+YreiZPcg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Nov 2025 15:20:51 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> > > >    393  static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> > > >    394  {
> > > >    395          const struct luo_ioctl_op *op;
> > > >    396          struct luo_ucmd ucmd = {};
> > > >    397          union ucmd_buffer buf;
> > > >    398          unsigned int nr;
> > > >    399          int err;
> > > >    400
> > > >    401          nr = _IOC_NR(cmd);
> > > >  > 402          if (nr < LIVEUPDATE_CMD_BASE ||
> > > >    403              (nr - LIVEUPDATE_CMD_BASE) >= ARRAY_SIZE(luo_ioctl_ops)) {
> > >
> > > This is a false positive. The logic is designed to work generically
> > > for any base, similar to how it is handled in session ioctl and
> > > iommufd ictl. The warning only triggers because LIVEUPDATE_CMD_BASE
> > > happens to be 0 in this specific case.
> >
> > This is a difficult situation.
> >
> > In some cases smatch has found a bug, in other cases it's just being
> > irritating.
> >
> > I think there is value in smatch occasionally finding bugs, and to
> > support that we should try to rearrange false positives so that smatch
> > doesn't report on those.
> >
> > Perhaps there's some way we can do that here, without uglifying things?
> 
> Yes, we can make "unsigned int nr;" signed: "int nr;", should be OK.
> Would you like me to send a fix patch with this change?

Sure, thanks.  It's a bit lame using an inappropriate type but the
world won't end if we do.
