Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31E2571DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764446442; cv=none; b=pRcjfVqaobmHh7GPwPiqlwIChDlBY9tmpvjakWIiDBYh8iwcabHdCtkOD58Mle1QKiDsj8Asl1wHD4gewKHW8lAHil7c4Ou62kYC9c5uwqlO4mkqthPKxqQ6sm9I3ClTX3wDXGIwNlXwSOaAXCuj0MvfKno478UuzVSoCWU3OYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764446442; c=relaxed/simple;
	bh=IPHHTKItiB7WTnDJDqoos611O4zAvsigzBDkYQSCbV8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qCzRlSIIWgKf+2+3zuEbtTtsegB8urjjXohjqa3/DO/oESZBzlpHfHnvL+WxdRb/s63rWvRi9EgV7jF0PwO+6roRE1SYsCVU+oU3zApzt28O6LzM3FwGKrAIOwZDrsK3NdPjjZelZxfePBN2r1BbvirPL91tlZfxzZWOqF1mUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QBh8QjBn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QBh8QjBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D178C4CEFB;
	Sat, 29 Nov 2025 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764446441;
	bh=IPHHTKItiB7WTnDJDqoos611O4zAvsigzBDkYQSCbV8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QBh8QjBnetjbwykZ0IYWtUs3fXqA3ZrRMXZo393ybqK2p8QA2u6zTj1+OwX/jCoz1
	 ruJ9UVbY+C5tepMqbMynOv6mlqVbj6lEYJI730Ok31ZzRp7j38YnFM3LYWrNWmv3d3
	 rVgOINYxbN+Fv+OBgRFbGFgEwBw9V+o5A+YljZ64=
Date: Sat, 29 Nov 2025 12:00:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [linux-next:master 12118/12398]
 kernel/liveupdate/luo_core.c:402 luo_ioctl() warn: unsigned 'nr' is never
 less than zero.
Message-Id: <20251129120040.fb60e8a35d54d66c0bdbdf33@linux-foundation.org>
In-Reply-To: <CA+CK2bCmp4gjpyND2=Chdz-EfRAF20unYzO2dwQb+ZTEihgk3w@mail.gmail.com>
References: <202511280300.6pvBmXUS-lkp@intel.com>
	<CA+CK2bCmp4gjpyND2=Chdz-EfRAF20unYzO2dwQb+ZTEihgk3w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Nov 2025 14:51:28 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> > smatch warnings:
> > kernel/liveupdate/luo_core.c:402 luo_ioctl() warn: unsigned 'nr' is never less than zero.
> >
> > vim +/nr +402 kernel/liveupdate/luo_core.c
> >
> >    392
> >    393  static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> >    394  {
> >    395          const struct luo_ioctl_op *op;
> >    396          struct luo_ucmd ucmd = {};
> >    397          union ucmd_buffer buf;
> >    398          unsigned int nr;
> >    399          int err;
> >    400
> >    401          nr = _IOC_NR(cmd);
> >  > 402          if (nr < LIVEUPDATE_CMD_BASE ||
> >    403              (nr - LIVEUPDATE_CMD_BASE) >= ARRAY_SIZE(luo_ioctl_ops)) {
> 
> This is a false positive. The logic is designed to work generically
> for any base, similar to how it is handled in session ioctl and
> iommufd ictl. The warning only triggers because LIVEUPDATE_CMD_BASE
> happens to be 0 in this specific case.

This is a difficult situation.

In some cases smatch has found a bug, in other cases it's just being
irritating.

I think there is value in smatch occasionally finding bugs, and to
support that we should try to rearrange false positives so that smatch
doesn't report on those.

Perhaps there's some way we can do that here, without uglifying things?
