Content-Type: multipart/mixed; boundary="===============7856082904030979565=="
MIME-Version: 1.0
From: Rojewski, Cezary <cezary.rojewski@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/intel/catpt/dsp.c:359:9: sparse: sparse: restricted pci_power_t degrades to integer
Date: Thu, 22 Oct 2020 14:33:18 +0000
Message-ID: <3816407d96874a8599a589845943e885@intel.com>
In-Reply-To: <20201022140920.GA501158@bjorn-Precision-5520>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7856082904030979565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-10-22 4:09 PM, Bjorn Helgaas wrote:
> On Thu, Oct 22, 2020 at 04:52:29PM +0300, Andy Shevchenko wrote:
>> +Cc: Bjorn
>>
>> On Thu, Oct 22, 2020 at 03:25:49PM +0800, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
>>> head:   f804b3159482eedbb4250b1e9248c308fb63b805
>>> commit: 6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1 ASoC: Intel: Select ca=
tpt and deprecate haswell
>>> date:   3 weeks ago
>>> config: i386-randconfig-s002-20201022 (attached as .config)
>>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>>> reproduce:
>>>          # apt-get install sparse
>>>          # sparse version: v0.6.3-dirty
>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3D6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1
>>>          git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
>>>          git fetch --no-tags linus master
>>>          git checkout 6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1
>>>          # save the attached .config to linux build tree
>>>          make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'=
 ARCH=3Di386
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>>
>>> "sparse warnings: (new ones prefixed by >>)"
>>>>> sound/soc/intel/catpt/dsp.c:359:9: sparse: sparse: restricted pci_pow=
er_t degrades to integer
>>>     sound/soc/intel/catpt/dsp.c:372:9: sparse: sparse: restricted pci_p=
ower_t degrades to integer
>>>     sound/soc/intel/catpt/dsp.c:423:9: sparse: sparse: restricted pci_p=
ower_t degrades to integer
>>>     sound/soc/intel/catpt/dsp.c:447:9: sparse: sparse: restricted pci_p=
ower_t degrades to integer
>>
>> I dunno who and why created that specific bitwise type. I met not the fi=
rst
>> time the same Sparse complain.
> =

> Thanks for the cc.  Yeah, I hate that too.  It's one of the few
> remaining warnings in drivers/pci/.  It's my goal to eradicate it for
> v5.11.
> =


I've ignored that warning when upstreaming catpt ASoC driver as I
believe code is more readable when constants are not prepended with
explicit cast in this very case.

Should the warning be ignored (leave code as is) -or- do you want me to
prepend all PCI_Dx usages with explicit cast regardless of my initial
intentions?

Regards,
Czarek

--===============7856082904030979565==--

