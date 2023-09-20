Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692FA49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 01:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86643C433C7;
	Wed, 20 Sep 2023 01:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1695172582;
	bh=ZJvJelQHpjIsZ4koDpubhMJD9fKMY42nHXLM3+Cc++k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t3wZndf2jFKdtKpqi6QxOV1db4+UoZX04LgBoPhwZ/XIvOo5qifR6InaHB/Gpu04W
	 92yUDmqD75UnCPnYcU0yw33jpOiKBhZfwCvZm67siwmdFWhpcghnoC8g30nHX6bD6D
	 rn7Zh1oQNBwS3xw0OFZs6pTkdrMBEVb674kMwIWE=
Date: Tue, 19 Sep 2023 18:16:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Zhen Lei
 <thunder.leizhen@huawei.com>
Subject: Re: [linux-next:master 5741/5912] kernel/crash_core.c:214:13:
 warning: argument 2 null where non-null expected
Message-Id: <20230919181621.382be43e97f51effb47ab412@linux-foundation.org>
In-Reply-To: <ZQoqsV3xLvQuGW1d@MiWiFi-R3L-srv>
References: <202309191144.B0MToaPG-lkp@intel.com>
	<20230919094200.0f6495393a8eef3dc398e8ac@linux-foundation.org>
	<ZQoqsV3xLvQuGW1d@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 Sep 2023 07:11:45 +0800 Baoquan He <bhe@redhat.com> wrote:

> > 
> > 	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
> > 				crash_base, NULL);
> > 
> > and that suffix==NULL gets passed through to the strncmp()?
> 
> Yeah, this looks like a false positive report. I reproduced this, below
> change can mute the warning. However, the null pointer checking has been
> done in __parse_crashkernel() when calls parse_crashkernel_suffix().

How the heck did I miss that.

> Add below check anyway to satisfy the W=1 compiling?

I dunno, gcc is so wrong here I'm inclined to leave it as-is, because
surely this will get fixed in later gcc's.

> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -204,6 +204,9 @@ static int __init parse_crashkernel_suffix(char *cmdline,
>  {
>  	char *cur = cmdline;
>  
> +	if(!suffix)
> +		return -EINVAL;
> +
>  	*crash_size = memparse(cmdline, &cur);
>  	if (cmdline == cur) {
>  		pr_warn("crashkernel: memory value expected\n");

If we were to do this, let's have a comment explaining why we're doing
it - otherwise helpful people will try to remove it again.
