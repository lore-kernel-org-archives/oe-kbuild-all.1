Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5717CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 01:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695173809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=baEu5FPyeTXJzYRHn3PcdTp5ENYXg7QNVbnUbXlgQOg=;
	b=aEDn3qUo87UV0q6HybS1sCBoCrxoqK/Ai+8SRyJJZ10vo0PTsIIAx+zZl6mTBqmHHcc6jk
	4snQo+zYepNssmaT/VhQ8B4Ya2Y2qB6gBIm80iUqFjw0W4xMc3Swlhrh8WYM8cuL0zaH8/
	rylnIE40kZiZhr8ujr4t7cJ6gQRoH8A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-HVVPq3jcP_aQ9b8IppfD7A-1; Tue, 19 Sep 2023 21:36:46 -0400
X-MC-Unique: HVVPq3jcP_aQ9b8IppfD7A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBF67800969;
	Wed, 20 Sep 2023 01:36:45 +0000 (UTC)
Received: from localhost (unknown [10.72.112.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06803492B05;
	Wed, 20 Sep 2023 01:36:44 +0000 (UTC)
Date: Wed, 20 Sep 2023 09:36:41 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [linux-next:master 5741/5912] kernel/crash_core.c:214:13:
 warning: argument 2 null where non-null expected
Message-ID: <ZQpMqbNvjZxX/aDJ@MiWiFi-R3L-srv>
References: <202309191144.B0MToaPG-lkp@intel.com>
 <20230919094200.0f6495393a8eef3dc398e8ac@linux-foundation.org>
 <ZQoqsV3xLvQuGW1d@MiWiFi-R3L-srv>
 <20230919181621.382be43e97f51effb47ab412@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230919181621.382be43e97f51effb47ab412@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 09/19/23 at 06:16pm, Andrew Morton wrote:
> On Wed, 20 Sep 2023 07:11:45 +0800 Baoquan He <bhe@redhat.com> wrote:
> 
> > > 
> > > 	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
> > > 				crash_base, NULL);
> > > 
> > > and that suffix==NULL gets passed through to the strncmp()?
> > 
> > Yeah, this looks like a false positive report. I reproduced this, below
> > change can mute the warning. However, the null pointer checking has been
> > done in __parse_crashkernel() when calls parse_crashkernel_suffix().
> 
> How the heck did I miss that.
> 
> > Add below check anyway to satisfy the W=1 compiling?
> 
> I dunno, gcc is so wrong here I'm inclined to leave it as-is, because
> surely this will get fixed in later gcc's.
> 
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -204,6 +204,9 @@ static int __init parse_crashkernel_suffix(char *cmdline,
> >  {
> >  	char *cur = cmdline;
> >  
> > +	if(!suffix)
> > +		return -EINVAL;
> > +
> >  	*crash_size = memparse(cmdline, &cur);
> >  	if (cmdline == cur) {
> >  		pr_warn("crashkernel: memory value expected\n");
> 
> If we were to do this, let's have a comment explaining why we're doing
> it - otherwise helpful people will try to remove it again.

I will post v4 patchset anyway to include another fixing in patch 6/9
since LKP spotted a real issue causing compiling warning. I can add this
change with a comment to explain why the checking is needed here.

