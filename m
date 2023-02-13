Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD223A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 08:57:27 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id E891880C4E;
	Mon, 13 Feb 2023 08:38:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 904AA32;
	Mon, 13 Feb 2023 08:37:59 +0000 (UTC)
Date: Mon, 13 Feb 2023 03:37:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yafang Shao <laoar.shao@gmail.com>, kernel test robot <lkp@intel.com>
CC: oe-kbuild-all@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5Btrace=3Atrace/urgent_13/13=5D_?= =?US-ASCII?Q?kernel/trace/trace=5Fevents=2Ec=3A158?= =?US-ASCII?Q?=3A5=3A_warning=3A_no_previous_protot?= =?US-ASCII?Q?ype_for_=27trace=5Fdefine=5Ffield=5Fext=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CALOAHbBwyEgW58RD-0Hw_Rn42bTRvFX6dzyCX-4_JyCyPaRR=Q@mail.gmail.com>
References: <202302130750.679RaRog-lkp@intel.com> <CALOAHbBwyEgW58RD-0Hw_Rn42bTRvFX6dzyCX-4_JyCyPaRR=Q@mail.gmail.com>
Message-ID: <FFFF116D-A7F6-44DF-AC38-10B5E569290C@goodmis.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 904AA32
X-Spam-Status: No, score=0.38
X-Stat-Signature: yaxciyybge6dwtgso9c5fw8gwzgmq5hj
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/jrgyftNCo/D93/mHUddPZ46XUUBW2g/U=
X-HE-Tag: 1676277479-67317
X-HE-Meta: U2FsdGVkX1+WHq2ykX0bMW/4fKHJf4ps1yFcrxRcKKc4rbY5fG+b1OxjsV40YfB5MU79tqUGJLH5YXbEUyBqLg==



On February 12, 2023 11:20:59 PM EST, Yafang Shao <laoar=2Eshao@gmail=2Eco=
m> wrote:
>On Mon, Feb 13, 2023 at 7:30 AM kernel test robot <lkp@intel=2Ecom> wrote=
:
>>
>> tree:   git://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/trace/linux-t=
race trace/urgent
>> head:   b6c7abd1c28a63ad633433d037ee15a1bc3023ba
>> commit: b6c7abd1c28a63ad633433d037ee15a1bc3023ba [13/13] tracing: Fix T=
ASK_COMM_LEN in trace event format file
>> config: sh-allmodconfig (https://download=2E01=2Eorg/0day-ci/archive/20=
230213/202302130750=2E679RaRog-lkp@intel=2Ecom/config)
>> compiler: sh4-linux-gcc (GCC) 12=2E1=2E0
>> reproduce (this is a W=3D1 build):
>>         wget https://raw=2Egithubusercontent=2Ecom/intel/lkp-tests/mast=
er/sbin/make=2Ecross -O ~/bin/make=2Ecross
>>         chmod +x ~/bin/make=2Ecross
>>         # https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/trace/lin=
ux-trace=2Egit/commit/?id=3Db6c7abd1c28a63ad633433d037ee15a1bc3023ba
>>         git remote add trace git://git=2Ekernel=2Eorg/pub/scm/linux/ker=
nel/git/trace/linux-trace
>>         git fetch --no-tags trace trace/urgent
>>         git checkout b6c7abd1c28a63ad633433d037ee15a1bc3023ba
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/=2Econfig
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12=2E1=2E0 ma=
ke=2Ecross W=3D1 O=3Dbuild_dir ARCH=3Dsh olddefconfig
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12=2E1=2E0 ma=
ke=2Ecross W=3D1 O=3Dbuild_dir ARCH=3Dsh SHELL=3D/bin/bash kernel/trace/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel=2Ecom>
>> | Link: https://lore=2Ekernel=2Eorg/oe-kbuild-all/202302130750=2E679RaR=
og-lkp@intel=2Ecom/
>>
>> All warnings (new ones prefixed by >>):
>>
>> >> kernel/trace/trace_events=2Ec:158:5: warning: no previous prototype =
for 'trace_define_field_ext' [-Wmissing-prototypes]
>>      158 | int trace_define_field_ext(struct trace_event_call *call, co=
nst char *type,
>>          |     ^~~~~~~~~~~~~~~~~~~~~~
>>
>
>Thanks for the report=2E
>Should make trace_define_field_ext static=2E
>I will send a fix=2E

No need, I already made one and it just passed my tests=2E I'll be sending=
 a pull request shortly=2E

-- Steve

>
>>
>> vim +/trace_define_field_ext +158 kernel/trace/trace_events=2Ec
>>
>>    157
>>  > 158  int trace_define_field_ext(struct trace_event_call *call, const=
 char *type,
>>    159                         const char *name, int offset, int size, =
int is_signed,
>>    160                         int filter_type, int len)
>>    161  {
>>    162          struct list_head *head;
>>    163
>>    164          if (WARN_ON(!call->class))
>>    165                  return 0;
>>    166
>>    167          head =3D trace_get_fields(call);
>>    168          return __trace_define_field(head, type, name, offset, s=
ize,
>>    169                                      is_signed, filter_type, len=
);
>>    170  }
>>    171
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github=2Ecom/intel/lkp-tests
>
>
>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity and =
top posting=2E
