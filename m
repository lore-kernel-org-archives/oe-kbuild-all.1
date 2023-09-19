Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2C46A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695165113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSpQEVz82hsWdCT2oLCL1sbssVlUunFYm/OwYRtnCJ0=;
	b=Fcl5wVFyDUyrJG2Ss6gMvlaU9o5+FUUYUBN2RRTMpLCAZDNHk3NfkP0DccsQ1hnvLS0Fjh
	F19lKcpg/54d9MJL0oIhf1NfBBkbFRZazUGBwq7/Q0VJui/KoHOXq0iMizduiTTyT0uU9H
	8rxtSR0kouXKLmYpQLJUQOVnAioEzBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-PQTOcgODPyyiI5jmW6999g-1; Tue, 19 Sep 2023 19:11:50 -0400
X-MC-Unique: PQTOcgODPyyiI5jmW6999g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050A9811E7B;
	Tue, 19 Sep 2023 23:11:50 +0000 (UTC)
Received: from localhost (unknown [10.72.112.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1203E20268CC;
	Tue, 19 Sep 2023 23:11:48 +0000 (UTC)
Date: Wed, 20 Sep 2023 07:11:45 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [linux-next:master 5741/5912] kernel/crash_core.c:214:13:
 warning: argument 2 null where non-null expected
Message-ID: <ZQoqsV3xLvQuGW1d@MiWiFi-R3L-srv>
References: <202309191144.B0MToaPG-lkp@intel.com>
 <20230919094200.0f6495393a8eef3dc398e8ac@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230919094200.0f6495393a8eef3dc398e8ac@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 09/19/23 at 09:42am, Andrew Morton wrote:
> On Tue, 19 Sep 2023 12:02:17 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   7fc7222d9680366edeecc219c21ca96310bdbc10
> > commit: 5c322f6aad10f0920f842a4ccf82e9b9f351c0a5 [5741/5912] crash_core.c: remove unneeded functions
> > config: s390-buildonly-randconfig-r006-20220512 (https://download.01.org/0day-ci/archive/20230919/202309191144.B0MToaPG-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 11.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191144.B0MToaPG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309191144.B0MToaPG-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from arch/s390/include/asm/atomic.h:12,
> >                     from include/linux/atomic.h:7,
> >                     from include/linux/mm_types_task.h:13,
> >                     from include/linux/mm_types.h:5,
> >                     from include/linux/buildid.h:5,
> >                     from kernel/crash_core.c:7:
> >    kernel/crash_core.c: In function 'parse_crashkernel_suffix.constprop':
> > >> kernel/crash_core.c:214:13: warning: argument 2 null where non-null expected [-Wnonnull]
> >      214 |         if (strncmp(cur, suffix, strlen(suffix))) {
> >    include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
> >       68 |         (cond) ?                                        \
> >          |          ^~~~
> >    include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
> >       55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> >          |                            ^~~~~~~~~~~~~~
> 
> Looks legit?  parse_crashkernel() does
> 
> 	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
> 				crash_base, NULL);
> 
> and that suffix==NULL gets passed through to the strncmp()?

Yeah, this looks like a false positive report. I reproduced this, below
change can mute the warning. However, the null pointer checking has been
done in __parse_crashkernel() when calls parse_crashkernel_suffix().

Add below check anyway to satisfy the W=1 compiling?

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 1a77d466eaed..b53270ac3715 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -204,6 +204,9 @@ static int __init parse_crashkernel_suffix(char *cmdline,
 {
 	char *cur = cmdline;
 
+	if(!suffix)
+		return -EINVAL;
+
 	*crash_size = memparse(cmdline, &cur);
 	if (cmdline == cur) {
 		pr_warn("crashkernel: memory value expected\n");

