Content-Type: multipart/mixed; boundary="===============6044494048372272449=="
MIME-Version: 1.0
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 7592/7905] arch/riscv/mm/ptdump.c:57:3: error: 'FIXADDR_START' undeclared here (not in a function); did you mean 'XAS_RESTART'?
Date: Thu, 14 May 2020 16:37:22 +0800
Message-ID: <2a772f7b-bf5c-9f12-a3c9-92fb3e886f77@huawei.com>
In-Reply-To: <CANXhq0qBwoRwHc1c+LUrFS93LNCoLZdv0TK=mHmGf+Oh1wKBiA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6044494048372272449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2020/5/14 11:47, Zong Li wrote:
> On Thu, May 14, 2020 at 9:07 AM Andrew Morton <akpm@linux-foundation.or=
g> wrote:
>> On Sat, 9 May 2020 18:46:50 +0800 kbuild test robot <lkp@intel.com> wr=
ote:
>>
>>> Hi Zong,
>>>
>>> First bad commit (maybe !=3D root cause):
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
>>> head:   30e2206e11ce27ae910cc0dab21472429e400a87
>>> commit: c0eba2d72e70b4208ca6fd82820ba7428090e350 [7592/7905] riscv: sup=
port DEBUG_WX
>>> config: riscv-randconfig-r003-20200509 (attached as .config)
>>> compiler: riscv64-linux-gcc (GCC) 9.3.0
>>> reproduce:
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          git checkout c0eba2d72e70b4208ca6fd82820ba7428090e350
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cr=
oss ARCH=3Driscv
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>
>>> All error/warnings (new ones prefixed by >>):
>>>
>>>>> arch/riscv/mm/ptdump.c:57:3: error: 'FIXADDR_START' undeclared here (=
not in a function); did you mean 'XAS_RESTART'?
>>>        57 |  {FIXADDR_START,  "Fixmap start"},
>>>           |   ^~~~~~~~~~~~~
>>>           |   XAS_RESTART
>> argh, I can't figure out how to make riscv compile :(
>>
>> Are you using the riscv32 toolchain or riscv64?
>>
>> And arch/riscv/include/asm/perf_event.h does
>>
>> #ifdef CONFIG_RISCV_BASE_PMU
>> #define RISCV_MAX_COUNTERS      2
>> #endif
>>
>> #ifndef RISCV_MAX_COUNTERS
>> #error "Please provide a valid RISCV_MAX_COUNTERS for the PMU."
>> #endif
>>
>> where is RISCV_MAX_COUNTERS supposed to come from?  Surely this should
>> be implemented in Kconfig somehow?
>>
>> Sigh.  Zong, did you take a look at this?
> Yes, I had taken a look at that, the problem is that the .config
> selects CONFIG_PERF_EVENTS, but doesn't select CONFIG_RISCV_BASE_PMU
> together. It seems to me that it is a bug of perf porting on RISC-V,
> CONFIG_RISCV_BASE_PMU could be selected or unselected, but in fact,
> CONFIG_RISCV_BASE_PMU must be always selected when selecting
> CONFIG_PERF_EVENTS on RISC-V perf implementation. Maybe let me send a
> patch to fix it.

Hi Andrew and Zong, I have sent some fix patches, and Palmer accept

them.

https://lore.kernel.org/linux-riscv/mhng-d7e9b8e8-2c97-490b-9eac-fd88c7a5a3=
4d(a)palmerdabbelt-glaptop1/T/#t

>
>
>

--===============6044494048372272449==--

