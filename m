Content-Type: multipart/mixed; boundary="===============7315762389835624960=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [vfs:work.epoll 17/27] fs/eventpoll.c:1629:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Mon, 26 Oct 2020 17:45:40 +0800
Message-ID: <35d2f16c-7b53-0088-7e7c-aa04451b8fb8@intel.com>
In-Reply-To: <20201026023559.GC3576660@ZenIV.linux.org.uk>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7315762389835624960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/26/20 10:35 AM, Al Viro wrote:
> On Mon, Oct 26, 2020 at 10:09:47AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git wor=
k.epoll
>> head:   319c15174757aaedacc89a6e55c965416f130e64
>> commit: ff07952aeda8563d5080da3a0754db83ed0650f6 [17/27] ep_send_events_=
proc(): fold into the caller
>> compiler: h8300-linux-gcc (GCC) 9.3.0
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> "cppcheck warnings: (new ones prefixed by >>)"
>>>> fs/eventpoll.c:1629:3: warning: Assignment of function parameter has n=
o effect outside the function. Did you forget dereferencing it? [uselessAss=
ignmentPtrArg]
>>       events++;
>>       ^
> Who the hell has come up with that warning?  What happens is,
> essentially,
>
> f(..., events, ....)
> 	loop in which we have
> 		g(events, something); // store the next sample
> 		events++;
>
> More specifically, it's
>>    1620			if (__put_user(revents, &events->events) ||
>>    1621			    __put_user(epi->event.data, &events->data)) {
>>    1622				list_add(&epi->rdllink, &txlist);
>>    1623				ep_pm_stay_awake(epi);
>>    1624				if (!res)
>>    1625					res =3D -EFAULT;
>>    1626				break;
>>    1627			}
>>    1628			res++;
>>> 1629			events++;
> If anything, that should be reported to the maintainers of the buggy code.
> Which is not the kernel in this case.
>
> Google search on that thing brings this:
>
> 	Cppcheck is an analysis tool for C/C++ code. It detects the types of
> bugs that the compilers normally fail to detect. The goal is no false pos=
itives.
>
> IOW, that should be reported to the authors of that thing, seeing that
> their stated goal is obviously missed in this case.  Badly.  Assignments =
of
> function parameters can be perfectly idiomatic and this case is such.

Hi Al,

Thanks for the explanation, we'll avoid sending out such reports =

automatically
and double check the warning.

Best Regards,
Rong Chen


--===============7315762389835624960==--

