Content-Type: multipart/mixed; boundary="===============1800074986146020650=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] btrfs: fix devid 0 without a replace item by failing the mount
Date: Mon, 12 Oct 2020 10:51:21 +0800
Message-ID: <2358c0fe-3aa5-c395-eaca-8f6cddf86b9b@intel.com>
In-Reply-To: <9f78a512-5733-a44b-458e-0453a6a2b479@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1800074986146020650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/7/20 10:07 AM, Anand Jain wrote:
> On 6/10/20 10:54 pm, kernel test robot wrote:
>> Hi Anand,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on kdave/for-next]
>> [also build test ERROR on v5.9-rc8 next-20201006]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url: =

>> https://github.com/0day-ci/linux/commits/Anand-Jain/btrfs-fix-devid-0-wi=
thout-a-replace-item-by-failing-the-mount/20201006-210957
>> base: https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git =

>> for-next
>> config: i386-randconfig-s001-20201005 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install sparse
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # sparse version: v0.6.=
2-201-g24bdaac6-dirty
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

>> https://github.com/0day-ci/linux/commit/ed4ebb4eb3f213f048ea5f6a2ed80f6b=
d728c9e1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linux-re=
view https://github.com/0day-ci/linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags lin=
ux-review =

>> Anand-Jain/btrfs-fix-devid-0-without-a-replace-item-by-failing-the-mount=
/20201006-210957
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout ed4ebb4eb3=
f213f048ea5f6a2ed80f6bd728c9e1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make W=3D1 C=3D1 CF=3D'=
-fdiagnostic-prefix -D__CHECK_ENDIAN__' =

>> ARCH=3Di386
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/dev-replace.c: In function 'btrfs_init_dev_r=
eplace':
>>>> fs/btrfs/dev-replace.c:98:7: error: too few arguments to function =

>>>> 'btrfs_find_device'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98 |=C2=A0=C2=A0 if (btrfs_find_dev=
ice(fs_info->fs_devices,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 In file included from fs/btrfs/dev-replace.c:18:
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/volumes.h:455:22: note: declared here
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 455 | struct btrfs_device *btrfs_find_dev=
ice(struct =

>> btrfs_fs_devices *fs_devices,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/dev-replace.c:161:7: error: too few argument=
s to =

>> function 'btrfs_find_device'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 161 |=C2=A0=C2=A0 if (btrfs_find_device(f=
s_info->fs_devices,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
>> =C2=A0=C2=A0=C2=A0 In file included from fs/btrfs/dev-replace.c:18:
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/volumes.h:455:22: note: declared here
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 455 | struct btrfs_device *btrfs_find_dev=
ice(struct =

>> btrfs_fs_devices *fs_devices,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
>>
>
> =C2=A0Is there is a way to mention the patch dependencies, so that 0-Day =

> tests would understand. As in the patch's changelog, two dependent =

> patches [1] aren't in the misc-next yet.
>
> [1]
> https://patchwork.kernel.org/patch/11818635
> https://patchwork.kernel.org/patch/11796905

HI Anand,

The '--base' option in git format-patch may help, from man git format-patch:

BASE TREE INFORMATION
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The base tree information block is us=
ed for maintainers or third =

party testers to know the exact state the patch series applies to. It =

consists of the base commit, which is a well-known commit that is part =

of the stable part of the project history everybody else works
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 off of, and zero or more prerequisite=
 patches, which are =

well-known patches in flight that is not yet part of the base commit =

that need to be applied on top of base commit in topological order =

before the patches can be applied.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The base commit is shown as "base-com=
mit: " followed by the =

40-hex of the commit object name. A prerequisite patch is shown as =

"prerequisite-patch-id: " followed by the 40-hex patch id, which can be =

obtained by passing the patch through the git patch-id --stable
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 command.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Imagine that on top of the public com=
mit P, you applied =

well-known patches X, Y and Z from somebody else, and then built your =

three-patch series A, B, C, the history would be like:

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ---P---X---Y-=
--Z---A---B---C

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 With git format-patch --base=3DP -3 C=
 (or variants thereof, e.g. =

with --cover-letter or using Z..C instead of -3 C to specify the range), =

the base tree information block is shown at the end of the first message =

the command outputs (either the first patch, or the cover
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 letter), like this:

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base-commit: P
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prerequisite-=
patch-id: X
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prerequisite-=
patch-id: Y
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prerequisite-=
patch-id: Z

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For non-linear topology, such as

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ---P---X---A-=
--M---C
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Y---Z---B

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 You can also use git format-patch --b=
ase=3DP -3 C to generate =

patches for A, B and C, and the identifiers for P, X, Y, Z are appended =

at the end of the first message.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If set --base=3Dauto in cmdline, it w=
ill track base commit =

automatically, the base commit will be the merge base of tip commit of =

the remote-tracking branch and revision-range specified in cmdline. For =

a local branch, you need to track a remote branch by git branch
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --set-upstream-to before using this o=
ption.

Best Regards,
Rong Chen
--===============1800074986146020650==--

