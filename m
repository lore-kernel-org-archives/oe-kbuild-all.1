Content-Type: multipart/mixed; boundary="===============0142074987813271451=="
MIME-Version: 1.0
From: Thara Gopinath <thara.gopinath@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:sched/wip-deadline 3/19] kernel//sched/pelt.c:393:43: error: too many arguments to function call, expected 2, have 3
Date: Thu, 27 Feb 2020 17:00:02 -0500
Message-ID: <47a6e4d8-1f78-f46c-1039-3554f27c391f@linaro.org>
In-Reply-To: <20200227081439.GE18400@hirez.programming.kicks-ass.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0142074987813271451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/27/20 3:14 AM, Peter Zijlstra wrote:
> On Wed, Feb 26, 2020 at 11:35:24PM -0500, Thara Gopinath wrote:
>>
>>
>> On 2/26/20 1:59 AM, kbuild test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.gi=
t sched/wip-deadline
>>> head:   0467e3b09008e97dabd2373eaaa471fce23d32b4
>>> commit: 15ebf004a9f97a00bd84abab23bacfad39029623 [3/19] sched/pelt: Add=
 support to track thermal pressure
>>> config: arm64-allyesconfig (attached as .config)
>>> compiler: clang version 11.0.0 (git://gitmirror/llvm_project 396b725394=
4e927878dff2f6321efabb3aaa0f45)
>>> reproduce:
>>>           # FIXME the reproduce steps for clang is not ready yet
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> kernel//sched/pelt.c:393:43: error: too many arguments to function ca=
ll, expected 2, have 3
>>>                      ___update_load_avg(&rq->avg_thermal, 1, 1);
>>>                      ~~~~~~~~~~~~~~~~~~                      ^
>>>      kernel//sched/pelt.c:241:1: note: '___update_load_avg' declared he=
re
>>>      ___update_load_avg(struct sched_avg *sa, unsigned long load)
>>>      ^
>>>      1 error generated.
>>
>> Hi Peter,
>>
>> This is caused due to patch[1] from Vincent which has changed removed
>> runnable load avg parameter from __update_load_avg.  The fix is quite
>> trivial and is as follows.
>>
>> @@ -390,7 +390,7 @@ int update_thermal_load_avg(u64 now, struct rq *rq, =
u64
>> capacity)
>>                                 capacity,
>>                                 capacity,
>>                                 capacity)) {
>> -               ___update_load_avg(&rq->avg_thermal, 1, 1);
>> +               ___update_load_avg(&rq->avg_thermal, 1);
>>                  trace_pelt_thermal_tp(rq);
>>                  return 1;
>>          }
>>
>>
>>
>> How do you want me to proceed here?
>> Do you want me to resend the entire series after re-basing to tip/sched/=
core
>> or do you just want to fix this in your branch?
> =

> I had already fixed this up and re-pushed. My bad for not doing a local
> compile test before pushing it out :-)

Thanks!

> =

> See here:
> =

>    https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?=
h=3Dsched/core
> =


-- =

Warm Regards
Thara
--===============0142074987813271451==--

