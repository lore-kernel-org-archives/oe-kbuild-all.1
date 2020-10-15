Content-Type: multipart/mixed; boundary="===============3588427538252978517=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-5.4.y 665/2391] drivers/android/binder.c:3776: Error: unrecognized keyword/register name `l.lwz
Date: Fri, 16 Oct 2020 05:28:34 +0800
Message-ID: <202010160523.r8yMbvrW-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3588427538252978517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.4.y
head:   85b0841aab15c12948af951d477183ab3df7de14
commit: c5665cafbedd2e2a523fe933e452391a02d3adb3 [665/2391] binder: Prevent=
 context manager from incrementing ref 0
config: openrisc-randconfig-r002-20201014 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3Dc5665cafbedd2e2a523fe933e452391a02d3adb3
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.4.y
        git checkout c5665cafbedd2e2a523fe933e452391a02d3adb3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/android/binder.c: Assembler messages:
>> drivers/android/binder.c:3776: Error: unrecognized keyword/register name=
 `l.lwz ?ap,4(r25)'
   drivers/android/binder.c:3781: Error: unrecognized keyword/register name=
 `l.addi ?ap,r0,0'

vim +3776 drivers/android/binder.c

44d8047f1d87adc drivers/android/binder.c         Todd Kjos              201=
8-08-28  3602  =

fb07ebc3e82a98a drivers/staging/android/binder.c Bojan Prtvar           201=
3-09-02  3603  static int binder_thread_write(struct binder_proc *proc,
fb07ebc3e82a98a drivers/staging/android/binder.c Bojan Prtvar           201=
3-09-02  3604  			struct binder_thread *thread,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3605  			binder_uintptr_t binder_buffer, size_t size,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3606  			binder_size_t *consumed)
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3607  {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3608  	uint32_t cmd;
342e5c90b60134d drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3609  	struct binder_context *context =3D proc->context;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3610  	void __user *buffer =3D (void __user *)(uintptr_t=
)binder_buffer;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3611  	void __user *ptr =3D buffer + *consumed;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3612  	void __user *end =3D buffer + size;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3613  =

26549d17741035b drivers/android/binder.c         Todd Kjos              201=
7-06-29  3614  	while (ptr < end && thread->return_error.cmd =3D=3D BR_OK) {
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3615  		int ret;
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3616  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3617  		if (get_user(cmd, (uint32_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3618  			return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3619  		ptr +=3D sizeof(uint32_t);
975a1ac9a9fe65d drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2012-10-16  3620  		trace_binder_command(cmd);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3621  		if (_IOC_NR(cmd) < ARRAY_SIZE(binder_stats.bc)) {
0953c7976c36ce0 drivers/android/binder.c         Badhri Jagan Sridharan 201=
7-06-29  3622  			atomic_inc(&binder_stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce0 drivers/android/binder.c         Badhri Jagan Sridharan 201=
7-06-29  3623  			atomic_inc(&proc->stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce0 drivers/android/binder.c         Badhri Jagan Sridharan 201=
7-06-29  3624  			atomic_inc(&thread->stats.bc[_IOC_NR(cmd)]);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3625  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3626  		switch (cmd) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3627  		case BC_INCREFS:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3628  		case BC_ACQUIRE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3629  		case BC_RELEASE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3630  		case BC_DECREFS: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3631  			uint32_t target;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3632  			const char *debug_string;
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3633  			bool strong =3D cmd =3D=3D BC_ACQUIRE || cmd =3D=3D BC_RE=
LEASE;
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3634  			bool increment =3D cmd =3D=3D BC_INCREFS || cmd =3D=3D BC=
_ACQUIRE;
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3635  			struct binder_ref_data rdata;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3636  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3637  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3638  				return -EFAULT;
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3639  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3640  			ptr +=3D sizeof(uint32_t);
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3641  			ret =3D -1;
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3642  			if (increment && !target) {
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3643  				struct binder_node *ctx_mgr_node;
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3644  				mutex_lock(&context->context_mgr_node_lock);
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3645  				ctx_mgr_node =3D context->binder_context_mgr_node;
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3646  				if (ctx_mgr_node) {
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3647  					if (ctx_mgr_node->proc =3D=3D proc) {
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3648  						binder_user_error("%d:%d context manager tried to acqu=
ire desc 0\n",
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3649  								  proc->pid, thread->pid);
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3650  						mutex_unlock(&context->context_mgr_node_lock);
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3651  						return -EINVAL;
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3652  					}
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3653  					ret =3D binder_inc_ref_for_node(
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3654  							proc, ctx_mgr_node,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3655  							strong, NULL, &rdata);
c5665cafbedd2e2 drivers/android/binder.c         Jann Horn              202=
0-07-27  3656  				}
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3657  				mutex_unlock(&context->context_mgr_node_lock);
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3658  			}
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3659  			if (ret)
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3660  				ret =3D binder_update_ref_for_handle(
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3661  						proc, target, increment, strong,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3662  						&rdata);
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3663  			if (!ret && rdata.desc !=3D target) {
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3664  				binder_user_error("%d:%d tried to acquire reference to d=
esc %d, got %d instead\n",
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3665  					proc->pid, thread->pid,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3666  					target, rdata.desc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3667  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3668  			switch (cmd) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3669  			case BC_INCREFS:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3670  				debug_string =3D "IncRefs";
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3671  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3672  			case BC_ACQUIRE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3673  				debug_string =3D "Acquire";
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3674  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3675  			case BC_RELEASE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3676  				debug_string =3D "Release";
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3677  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3678  			case BC_DECREFS:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3679  			default:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3680  				debug_string =3D "DecRefs";
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3681  				break;
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3682  			}
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3683  			if (ret) {
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3684  				binder_user_error("%d:%d %s %d refcount change on invali=
d ref %d ret %d\n",
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3685  					proc->pid, thread->pid, debug_string,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3686  					strong, target, ret);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3687  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3688  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3689  			binder_debug(BINDER_DEBUG_USER_REFS,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3690  				     "%d:%d %s ref %d desc %d s %d w %d\n",
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3691  				     proc->pid, thread->pid, debug_string,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3692  				     rdata.debug_id, rdata.desc, rdata.strong,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3693  				     rdata.weak);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3694  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3695  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3696  		case BC_INCREFS_DONE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3697  		case BC_ACQUIRE_DONE: {
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3698  			binder_uintptr_t node_ptr;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3699  			binder_uintptr_t cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3700  			struct binder_node *node;
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3701  			bool free_node;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3702  =

da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3703  			if (get_user(node_ptr, (binder_uintptr_t __user=
 *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3704  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3705  			ptr +=3D sizeof(binder_uintptr_t);
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3706  			if (get_user(cookie, (binder_uintptr_t __user *=
)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3707  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3708  			ptr +=3D sizeof(binder_uintptr_t);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3709  			node =3D binder_get_node(proc, node_ptr);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3710  			if (node =3D=3D NULL) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3711  				binder_user_error("%d:%d %s u%016llx no match\=
n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3712  					proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3713  					cmd =3D=3D BC_INCREFS_DONE ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3714  					"BC_INCREFS_DONE" :
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3715  					"BC_ACQUIRE_DONE",
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3716  					(u64)node_ptr);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3717  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3718  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3719  			if (cookie !=3D node->cookie) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3720  				binder_user_error("%d:%d %s u%016llx node %d c=
ookie mismatch %016llx !=3D %016llx\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3721  					proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3722  					cmd =3D=3D BC_INCREFS_DONE ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3723  					"BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3724  					(u64)node_ptr, node->debug_id,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3725  					(u64)cookie, (u64)node->cookie);
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3726  				binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3727  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3728  			}
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3729  			binder_node_inner_lock(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3730  			if (cmd =3D=3D BC_ACQUIRE_DONE) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3731  				if (node->pending_strong_ref =3D=3D 0) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3732  					binder_user_error("%d:%d BC_ACQUIRE_DONE node %d has no=
 pending acquire request\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3733  						proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3734  						node->debug_id);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3735  					binder_node_inner_unlock(node);
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3736  					binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3737  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3738  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3739  				node->pending_strong_ref =3D 0;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3740  			} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3741  				if (node->pending_weak_ref =3D=3D 0) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3742  					binder_user_error("%d:%d BC_INCREFS_DONE node %d has no=
 pending increfs request\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3743  						proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3744  						node->debug_id);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3745  					binder_node_inner_unlock(node);
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3746  					binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3747  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3748  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3749  				node->pending_weak_ref =3D 0;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3750  			}
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3751  			free_node =3D binder_dec_node_nilocked(node,
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3752  					cmd =3D=3D BC_ACQUIRE_DONE, 0);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3753  			WARN_ON(free_node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3754  			binder_debug(BINDER_DEBUG_USER_REFS,
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3755  				     "%d:%d %s node %d ls %d lw %d tr %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3756  				     proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3757  				     cmd =3D=3D BC_INCREFS_DONE ? "BC_INCREFS_DONE" : "B=
C_ACQUIRE_DONE",
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3758  				     node->debug_id, node->local_strong_refs,
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3759  				     node->local_weak_refs, node->tmp_refs);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3760  			binder_node_inner_unlock(node);
adc1884222276df drivers/android/binder.c         Todd Kjos              201=
7-06-29  3761  			binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3762  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3763  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3764  		case BC_ATTEMPT_ACQUIRE:
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3765  			pr_err("BC_ATTEMPT_ACQUIRE not supported\n");
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3766  			return -EINVAL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3767  		case BC_ACQUIRE_RESULT:
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3768  			pr_err("BC_ACQUIRE_RESULT not supported\n");
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3769  			return -EINVAL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3770  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3771  		case BC_FREE_BUFFER: {
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3772  			binder_uintptr_t data_ptr;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3773  			struct binder_buffer *buffer;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3774  =

da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3775  			if (get_user(data_ptr, (binder_uintptr_t __user=
 *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30 @3776  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3777  			ptr +=3D sizeof(binder_uintptr_t);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3778  =

53d311cfa19ad35 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3779  			buffer =3D binder_alloc_prepare_to_free(&proc->alloc,
19c987241ca1216 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3780  							      data_ptr);
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3781  			if (IS_ERR_OR_NULL(buffer)) {
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3782  				if (PTR_ERR(buffer) =3D=3D -EPERM) {
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3783  					binder_user_error(
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3784  						"%d:%d BC_FREE_BUFFER u%016llx matched unreturned or c=
urrently freeing buffer\n",
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3785  						proc->pid, thread->pid,
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3786  						(u64)data_ptr);
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3787  				} else {
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3788  					binder_user_error(
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3789  						"%d:%d BC_FREE_BUFFER u%016llx no match\n",
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3790  						proc->pid, thread->pid,
7bada55ab506978 drivers/android/binder.c         Todd Kjos              201=
8-11-06  3791  						(u64)data_ptr);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3792  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3793  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3794  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3795  			binder_debug(BINDER_DEBUG_FREE_BUFFER,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3796  				     "%d:%d BC_FREE_BUFFER u%016llx found buff=
er %d for %s transaction\n",
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3797  				     proc->pid, thread->pid, (u64)data_ptr,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3798  				     buffer->debug_id,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3799  				     buffer->transaction ? "active" : "finished");
44d8047f1d87adc drivers/android/binder.c         Todd Kjos              201=
8-08-28  3800  			binder_free_buf(proc, buffer);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3801  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3802  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3803  =

7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3804  		case BC_TRANSACTION_SG:
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3805  		case BC_REPLY_SG: {
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3806  			struct binder_transaction_data_sg tr;
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3807  =

7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3808  			if (copy_from_user(&tr, ptr, sizeof(tr)))
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3809  				return -EFAULT;
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3810  			ptr +=3D sizeof(tr);
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3811  			binder_transaction(proc, thread, &tr.transaction_data,
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3812  					   cmd =3D=3D BC_REPLY_SG, tr.buffers_size);
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3813  			break;
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3814  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3815  		case BC_TRANSACTION:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3816  		case BC_REPLY: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3817  			struct binder_transaction_data tr;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3818  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3819  			if (copy_from_user(&tr, ptr, sizeof(tr)))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3820  				return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3821  			ptr +=3D sizeof(tr);
4bfac80af3a63f2 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3822  			binder_transaction(proc, thread, &tr,
4bfac80af3a63f2 drivers/android/binder.c         Martijn Coenen         201=
7-02-03  3823  					   cmd =3D=3D BC_REPLY, 0);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3824  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3825  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3826  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3827  		case BC_REGISTER_LOOPER:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3828  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3829  				     "%d:%d BC_REGISTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3830  				     proc->pid, thread->pid);
b3e6861283790d7 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3831  			binder_inner_proc_lock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3832  			if (thread->looper & BINDER_LOOPER_STATE_ENTERED) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3833  				thread->looper |=3D BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3834  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER calle=
d after BC_ENTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3835  					proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3836  			} else if (proc->requested_threads =3D=3D 0) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3837  				thread->looper |=3D BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3838  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER calle=
d without request\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3839  					proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3840  			} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3841  				proc->requested_threads--;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3842  				proc->requested_threads_started++;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3843  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3844  			thread->looper |=3D BINDER_LOOPER_STATE_REGISTERED;
b3e6861283790d7 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3845  			binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3846  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3847  		case BC_ENTER_LOOPER:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3848  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3849  				     "%d:%d BC_ENTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3850  				     proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3851  			if (thread->looper & BINDER_LOOPER_STATE_REGISTERED) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3852  				thread->looper |=3D BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3853  				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called a=
fter BC_REGISTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3854  					proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3855  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3856  			thread->looper |=3D BINDER_LOOPER_STATE_ENTERED;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3857  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3858  		case BC_EXIT_LOOPER:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3859  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3860  				     "%d:%d BC_EXIT_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3861  				     proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3862  			thread->looper |=3D BINDER_LOOPER_STATE_EXITED;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3863  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3864  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3865  		case BC_REQUEST_DEATH_NOTIFICATION:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3866  		case BC_CLEAR_DEATH_NOTIFICATION: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3867  			uint32_t target;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3868  			binder_uintptr_t cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3869  			struct binder_ref *ref;
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3870  			struct binder_ref_death *death =3D NULL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3871  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3872  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3873  				return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3874  			ptr +=3D sizeof(uint32_t);
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3875  			if (get_user(cookie, (binder_uintptr_t __user *=
)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3876  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3877  			ptr +=3D sizeof(binder_uintptr_t);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3878  			if (cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION) {
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3879  				/*
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3880  				 * Allocate memory for death notification
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3881  				 * before taking lock
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3882  				 */
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3883  				death =3D kzalloc(sizeof(*death), GFP_KERNEL);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3884  				if (death =3D=3D NULL) {
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3885  					WARN_ON(thread->return_error.cmd !=3D
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3886  						BR_OK);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3887  					thread->return_error.cmd =3D BR_ERROR;
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  3888  					binder_enqueue_thread_work(
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  3889  						thread,
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  3890  						&thread->return_error.work);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3891  					binder_debug(
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3892  						BINDER_DEBUG_FAILED_TRANSACTION,
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3893  						"%d:%d BC_REQUEST_DEATH_NOTIFICATION failed\n",
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3894  						proc->pid, thread->pid);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3895  					break;
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3896  				}
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3897  			}
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3898  			binder_proc_lock(proc);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3899  			ref =3D binder_get_ref_olocked(proc, target, false);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3900  			if (ref =3D=3D NULL) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3901  				binder_user_error("%d:%d %s invalid ref %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3902  					proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3903  					cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3904  					"BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3905  					"BC_CLEAR_DEATH_NOTIFICATION",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3906  					target);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3907  				binder_proc_unlock(proc);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3908  				kfree(death);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3909  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3910  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3911  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3912  			binder_debug(BINDER_DEBUG_DEATH_NOTIFICATION,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3913  				     "%d:%d %s %016llx ref %d desc %d s %d w %=
d for node %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3914  				     proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3915  				     cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3916  				     "BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3917  				     "BC_CLEAR_DEATH_NOTIFICATION",
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3918  				     (u64)cookie, ref->data.debug_id,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3919  				     ref->data.desc, ref->data.strong,
372e3147df7016e drivers/android/binder.c         Todd Kjos              201=
7-06-29  3920  				     ref->data.weak, ref->node->debug_id);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3921  =

ab51ec6bdf0b7af drivers/android/binder.c         Martijn Coenen         201=
7-06-29  3922  			binder_node_lock(ref->node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3923  			if (cmd =3D=3D BC_REQUEST_DEATH_NOTIFICATION) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3924  				if (ref->death) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3925  					binder_user_error("%d:%d BC_REQUEST_DEATH_NOTIFICATION =
death notification already set\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3926  						proc->pid, thread->pid);
ab51ec6bdf0b7af drivers/android/binder.c         Martijn Coenen         201=
7-06-29  3927  					binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3928  					binder_proc_unlock(proc);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3929  					kfree(death);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3930  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3931  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3932  				binder_stats_created(BINDER_STAT_DEATH);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3933  				INIT_LIST_HEAD(&death->work.entry);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3934  				death->cookie =3D cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3935  				ref->death =3D death;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3936  				if (ref->node->proc =3D=3D NULL) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3937  					ref->death->work.type =3D BINDER_WORK_DEAD_BINDER;
bb74562a7f83982 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3938  =

1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3939  					binder_inner_proc_lock(proc);
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3940  					binder_enqueue_work_ilocked(
bb74562a7f83982 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3941  						&ref->death->work, &proc->todo);
bb74562a7f83982 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3942  					binder_wakeup_proc_ilocked(proc);
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3943  					binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3944  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3945  			} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3946  				if (ref->death =3D=3D NULL) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  3947  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION de=
ath notification not active\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3948  						proc->pid, thread->pid);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3949  					binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3950  					binder_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3951  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3952  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3953  				death =3D ref->death;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3954  				if (death->cookie !=3D cookie) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3955  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIF=
ICATION death notification cookie mismatch %016llx !=3D %016llx\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3956  						proc->pid, thread->pid,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3957  						(u64)death->cookie,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3958  						(u64)cookie);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3959  					binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3960  					binder_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3961  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3962  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3963  				ref->death =3D NULL;
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3964  				binder_inner_proc_lock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3965  				if (list_empty(&death->work.entry)) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3966  					death->work.type =3D BINDER_WORK_CLEAR_DEATH_NOTIFICATI=
ON;
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3967  					if (thread->looper &
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3968  					    (BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3969  					     BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  3970  						binder_enqueue_thread_work_ilocked(
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  3971  								thread,
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  3972  								&death->work);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3973  					else {
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3974  						binder_enqueue_work_ilocked(
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3975  								&death->work,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3976  								&proc->todo);
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3977  						binder_wakeup_proc_ilocked(
408c68b17aea2f2 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  3978  								proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3979  					}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3980  				} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3981  					BUG_ON(death->work.type !=3D BINDER_WORK_DEAD_BINDER);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3982  					death->work.type =3D BINDER_WORK_DEAD_BINDER_AND_CLEAR;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3983  				}
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3984  				binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3985  			}
ab51ec6bdf0b7af drivers/android/binder.c         Martijn Coenen         201=
7-06-29  3986  			binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3987  			binder_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3988  		} break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3989  		case BC_DEAD_BINDER_DONE: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3990  			struct binder_work *w;
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3991  			binder_uintptr_t cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3992  			struct binder_ref_death *death =3D NULL;
10f62861b4a2f22 drivers/staging/android/binder.c Seunghun Lee           201=
4-05-01  3993  =

da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  3994  			if (get_user(cookie, (binder_uintptr_t __user *=
)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3995  				return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  3996  =

7a64cd887fdb97f drivers/android/binder.c         Lisa Du                201=
6-02-17  3997  			ptr +=3D sizeof(cookie);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3998  			binder_inner_proc_lock(proc);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  3999  			list_for_each_entry(w, &proc->delivered_death,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4000  					    entry) {
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4001  				struct binder_ref_death *tmp_death =3D
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4002  					container_of(w,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4003  						     struct binder_ref_death,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4004  						     work);
10f62861b4a2f22 drivers/staging/android/binder.c Seunghun Lee           201=
4-05-01  4005  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4006  				if (tmp_death->cookie =3D=3D cookie) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4007  					death =3D tmp_death;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4008  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4009  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4010  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4011  			binder_debug(BINDER_DEBUG_DEAD_BINDER,
8ca86f1639ec589 drivers/android/binder.c         Todd Kjos              201=
8-02-07  4012  				     "%d:%d BC_DEAD_BINDER_DONE %016llx found %pK\n",
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  4013  				     proc->pid, thread->pid, (u64)cookie,
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  4014  				     death);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4015  			if (death =3D=3D NULL) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  4016  				binder_user_error("%d:%d BC_DEAD_BINDER_DONE %=
016llx not found\n",
da49889deb34d35 drivers/staging/android/binder.c Arve Hj=C3=B8nnev=C3=A5g  =
       2014-02-21  4017  					proc->pid, thread->pid, (u64)cookie);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4018  				binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4019  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4020  			}
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4021  			binder_dequeue_work_ilocked(&death->work);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4022  			if (death->work.type =3D=3D BINDER_WORK_DEAD_BINDER_AND_C=
LEAR) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4023  				death->work.type =3D BINDER_WORK_CLEAR_DEATH_NOTIFICATIO=
N;
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4024  				if (thread->looper &
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4025  					(BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4026  					 BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  4027  					binder_enqueue_thread_work_ilocked(
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         201=
7-11-15  4028  						thread, &death->work);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4029  				else {
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4030  					binder_enqueue_work_ilocked(
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4031  							&death->work,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4032  							&proc->todo);
408c68b17aea2f2 drivers/android/binder.c         Martijn Coenen         201=
7-08-31  4033  					binder_wakeup_proc_ilocked(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4034  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4035  			}
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              201=
7-06-29  4036  			binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4037  		} break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4038  =

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4039  		default:
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            201=
2-10-30  4040  			pr_err("%d:%d unknown command %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4041  			       proc->pid, thread->pid, cmd);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4042  			return -EINVAL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4043  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4044  		*consumed =3D ptr - buffer;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4045  	}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4046  	return 0;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4047  }
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     201=
1-11-30  4048  =


:::::: The code at line 3776 was first introduced by commit
:::::: 355b0502f6efea0ff9492753888772c96972d2a3 Revert "Staging: android: d=
elete android drivers"

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3588427538252978517==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3588427538252978517==--

