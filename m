Content-Type: multipart/mixed; boundary="===============1402356652040590372=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8466:13: warning: stack frame size of 2112 bytes in function 'amdgpu_dm_atomic_commit_tail'
Date: Wed, 05 May 2021 20:26:36 +0800
Message-ID: <202105052028.V7hP755T-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1402356652040590372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nikola,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d665ea6ea86c785760ee4bad4543dab3267ad074
commit: a85ba00538cd4bb0655aaf57fe3ebf8cc21f4fea drm/amdgpu/display: re-ena=
ble freesync video patches
date:   6 weeks ago
config: powerpc-randconfig-r016-20210505 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a=
5836cc8e4c1def2bdeb022e7b496623439)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da85ba00538cd4bb0655aaf57fe3ebf8cc21f4fea
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a85ba00538cd4bb0655aaf57fe3ebf8cc21f4fea
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8466:13: war=
ning: stack frame size of 2112 bytes in function 'amdgpu_dm_atomic_commit_t=
ail' [-Wframe-larger-than=3D]
   static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
               ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8054:13: war=
ning: stack frame size of 2352 bytes in function 'amdgpu_dm_commit_planes' =
[-Wframe-larger-than=3D]
   static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
               ^
   2 warnings generated.


vim +/amdgpu_dm_atomic_commit_tail +8466 drivers/gpu/drm/amd/amdgpu/../disp=
lay/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland      2017-08-10  8457  =

b8592b48450b99 Leo Li              2018-09-14  8458  /**
b8592b48450b99 Leo Li              2018-09-14  8459   * amdgpu_dm_atomic_co=
mmit_tail() - AMDgpu DM's commit tail implementation.
b8592b48450b99 Leo Li              2018-09-14  8460   * @state: The atomic =
state to commit
b8592b48450b99 Leo Li              2018-09-14  8461   *
b8592b48450b99 Leo Li              2018-09-14  8462   * This will tell DC t=
o commit the constructed DC state from atomic_check,
b8592b48450b99 Leo Li              2018-09-14  8463   * programming the har=
dware. Any failures here implies a hardware failure, since
b8592b48450b99 Leo Li              2018-09-14  8464   * atomic check should=
 have filtered anything non-kosher.
b8592b48450b99 Leo Li              2018-09-14  8465   */
7578ecda14d521 Alex Deucher        2017-10-10 @8466  static void amdgpu_dm_=
atomic_commit_tail(struct drm_atomic_state *state)
e7b07ceef2a650 Harry Wentland      2017-08-10  8467  {
e7b07ceef2a650 Harry Wentland      2017-08-10  8468  	struct drm_device *de=
v =3D state->dev;
1348969ab68cb8 Luben Tuikov        2020-08-24  8469  	struct amdgpu_device =
*adev =3D drm_to_adev(dev);
e7b07ceef2a650 Harry Wentland      2017-08-10  8470  	struct amdgpu_display=
_manager *dm =3D &adev->dm;
e7b07ceef2a650 Harry Wentland      2017-08-10  8471  	struct dm_atomic_stat=
e *dm_state;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8472  	struct dc_state *dc_s=
tate =3D NULL, *dc_state_temp =3D NULL;
e7b07ceef2a650 Harry Wentland      2017-08-10  8473  	uint32_t i, j;
5cc6dcbd45a60b Leo (Sunpeng  Li    2017-10-12  8474) 	struct drm_crtc *crtc;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8475) 	struct drm_crtc_state=
 *old_crtc_state, *new_crtc_state;
e7b07ceef2a650 Harry Wentland      2017-08-10  8476  	unsigned long flags;
e7b07ceef2a650 Harry Wentland      2017-08-10  8477  	bool wait_for_vblank =
=3D true;
e7b07ceef2a650 Harry Wentland      2017-08-10  8478  	struct drm_connector =
*connector;
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8479) 	struct drm_connector_=
state *old_con_state, *new_con_state;
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8480) 	struct dm_crtc_state =
*dm_old_crtc_state, *dm_new_crtc_state;
fe2a19652918a5 Lyude Paul          2018-06-21  8481  	int crtc_disable_coun=
t =3D 0;
6ee90e88b97674 hersen wu           2020-07-08  8482  	bool mode_set_reset_r=
equired =3D false;
e7b07ceef2a650 Harry Wentland      2017-08-10  8483  =

e8a982355f9669 Rodrigo Siqueira    2020-09-04  8484  	trace_amdgpu_dm_atomi=
c_commit_tail_begin(state);
e8a982355f9669 Rodrigo Siqueira    2020-09-04  8485  =

e7b07ceef2a650 Harry Wentland      2017-08-10  8486  	drm_atomic_helper_upd=
ate_legacy_modeset_state(dev, state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8487  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8488  	dm_state =3D dm_atomi=
c_get_new_state(state);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8489  	if (dm_state && dm_st=
ate->context) {
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8490  		dc_state =3D dm_stat=
e->context;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8491  	} else {
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8492  		/* No state changes,=
 retain current state. */
813d20dccf93f8 Aidan Wood          2019-02-22  8493  		dc_state_temp =3D dc=
_create_state(dm->dc);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8494  		ASSERT(dc_state_temp=
);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8495  		dc_state =3D dc_stat=
e_temp;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8496  		dc_resource_state_co=
py_construct_current(dm->dc, dc_state);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8497  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8498  =

6d90a208cfff94 Aurabindo Pillai    2020-09-11  8499  	for_each_oldnew_crtc_=
in_state (state, crtc, old_crtc_state,
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8500  				       new_crtc_st=
ate, i) {
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8501  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8502  =

6d90a208cfff94 Aurabindo Pillai    2020-09-11  8503  		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8504  =

6d90a208cfff94 Aurabindo Pillai    2020-09-11  8505  		if (old_crtc_state->=
active &&
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8506  		    (!new_crtc_state=
->active ||
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8507  		     drm_atomic_crtc=
_needs_modeset(new_crtc_state))) {
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8508  			manage_dm_interrupt=
s(adev, acrtc, false);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8509  			dc_stream_release(d=
m_old_crtc_state->stream);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8510  		}
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8511  	}
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8512  =

8976f73b676eb9 Rodrigo Siqueira    2020-11-17  8513  	drm_atomic_helper_cal=
c_timestamping_constants(state);
8976f73b676eb9 Rodrigo Siqueira    2020-11-17  8514  =

e7b07ceef2a650 Harry Wentland      2017-08-10  8515  	/* update changed ite=
ms */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8516) 	for_each_oldnew_crtc_=
in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8517  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
b830ebc910f641 Harry Wentland      2017-07-26  8518  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8519) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8520) 		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8521  =

f1ad2f5efd29dc Harry Wentland      2017-09-12  8522  		DRM_DEBUG_DRIVER(
e7b07ceef2a650 Harry Wentland      2017-08-10  8523  			"amdgpu_crtc id:%d =
crtc_state_flags: enable:%d, active:%d, "
e7b07ceef2a650 Harry Wentland      2017-08-10  8524  			"planes_changed:%d,=
 mode_changed:%d,active_changed:%d,"
e7b07ceef2a650 Harry Wentland      2017-08-10  8525  			"connectors_changed=
:%d\n",
e7b07ceef2a650 Harry Wentland      2017-08-10  8526  			acrtc->crtc_id,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8527) 			new_crtc_state->ena=
ble,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8528) 			new_crtc_state->act=
ive,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8529) 			new_crtc_state->pla=
nes_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8530) 			new_crtc_state->mod=
e_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8531) 			new_crtc_state->act=
ive_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8532) 			new_crtc_state->con=
nectors_changed);
e7b07ceef2a650 Harry Wentland      2017-08-10  8533  =

5c68c65295de0b Victor Lu           2020-10-23  8534  		/* Disable cursor if=
 disabling crtc */
5c68c65295de0b Victor Lu           2020-10-23  8535  		if (old_crtc_state->=
active && !new_crtc_state->active) {
5c68c65295de0b Victor Lu           2020-10-23  8536  			struct dc_cursor_po=
sition position;
5c68c65295de0b Victor Lu           2020-10-23  8537  =

5c68c65295de0b Victor Lu           2020-10-23  8538  			memset(&position, 0=
, sizeof(position));
5c68c65295de0b Victor Lu           2020-10-23  8539  			mutex_lock(&dm->dc_=
lock);
5c68c65295de0b Victor Lu           2020-10-23  8540  			dc_stream_set_curso=
r_position(dm_old_crtc_state->stream, &position);
5c68c65295de0b Victor Lu           2020-10-23  8541  			mutex_unlock(&dm->d=
c_lock);
5c68c65295de0b Victor Lu           2020-10-23  8542  		}
5c68c65295de0b Victor Lu           2020-10-23  8543  =

27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8544) 		/* Copy all transien=
t state flags into dc state */
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8545) 		if (dm_new_crtc_stat=
e->stream) {
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8546) 			amdgpu_dm_crtc_copy=
_transient_flags(&dm_new_crtc_state->base,
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8547) 							    dm_new_crtc=
_state->stream);
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8548) 		}
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8549) =

e7b07ceef2a650 Harry Wentland      2017-08-10  8550  		/* handles headless =
hotplug case, updating new_state and
e7b07ceef2a650 Harry Wentland      2017-08-10  8551  		 * aconnector as nee=
ded
e7b07ceef2a650 Harry Wentland      2017-08-10  8552  		 */
e7b07ceef2a650 Harry Wentland      2017-08-10  8553  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8554) 		if (modeset_required=
(new_crtc_state, dm_new_crtc_state->stream, dm_old_crtc_state->stream)) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8555  =

f1ad2f5efd29dc Harry Wentland      2017-09-12  8556  			DRM_DEBUG_DRIVER("A=
tomic commit: SET crtc id %d: [%p]\n", acrtc->crtc_id, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8557  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8558) 			if (!dm_new_crtc_st=
ate->stream) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8559  				/*
e7b07ceef2a650 Harry Wentland      2017-08-10  8560  				 * this could happ=
en because of issues with
e7b07ceef2a650 Harry Wentland      2017-08-10  8561  				 * userspace notif=
ications delivery.
e7b07ceef2a650 Harry Wentland      2017-08-10  8562  				 * In this case us=
erspace tries to set mode on
1f6010a96273c3 David Francis       2018-08-15  8563  				 * display which i=
s disconnected in fact.
1f6010a96273c3 David Francis       2018-08-15  8564  				 * dc_sink is NULL=
 in this case on aconnector.
e7b07ceef2a650 Harry Wentland      2017-08-10  8565  				 * We expect reset=
 mode will come soon.
e7b07ceef2a650 Harry Wentland      2017-08-10  8566  				 *
e7b07ceef2a650 Harry Wentland      2017-08-10  8567  				 * This can also h=
appen when unplug is done
e7b07ceef2a650 Harry Wentland      2017-08-10  8568  				 * during resume s=
equence ended
e7b07ceef2a650 Harry Wentland      2017-08-10  8569  				 *
e7b07ceef2a650 Harry Wentland      2017-08-10  8570  				 * In this case, w=
e want to pretend we still
e7b07ceef2a650 Harry Wentland      2017-08-10  8571  				 * have a sink to =
keep the pipe running so that
e7b07ceef2a650 Harry Wentland      2017-08-10  8572  				 * hw state is con=
sistent with the sw state
e7b07ceef2a650 Harry Wentland      2017-08-10  8573  				 */
f1ad2f5efd29dc Harry Wentland      2017-09-12  8574  				DRM_DEBUG_DRIVER("=
%s: Failed to create new stream for crtc %d\n",
e7b07ceef2a650 Harry Wentland      2017-08-10  8575  						__func__, acrtc-=
>base.base.id);
e7b07ceef2a650 Harry Wentland      2017-08-10  8576  				continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8577  			}
e7b07ceef2a650 Harry Wentland      2017-08-10  8578  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8579) 			if (dm_old_crtc_sta=
te->stream)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8580) 				remove_stream(adev=
, acrtc, dm_old_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8581  =

97028037a38ae4 Lyude Paul          2018-06-04  8582  			pm_runtime_get_nore=
sume(dev->dev);
97028037a38ae4 Lyude Paul          2018-06-04  8583  =

e7b07ceef2a650 Harry Wentland      2017-08-10  8584  			acrtc->enabled =3D =
true;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8585) 			acrtc->hw_mode =3D =
new_crtc_state->mode;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8586) 			crtc->hwmode =3D ne=
w_crtc_state->mode;
6ee90e88b97674 hersen wu           2020-07-08  8587  			mode_set_reset_requ=
ired =3D true;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8588) 		} else if (modereset=
_required(new_crtc_state)) {
f1ad2f5efd29dc Harry Wentland      2017-09-12  8589  			DRM_DEBUG_DRIVER("A=
tomic commit: RESET. crtc id %d:[%p]\n", acrtc->crtc_id, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8590  			/* i.e. reset mode =
*/
6ee90e88b97674 hersen wu           2020-07-08  8591  			if (dm_old_crtc_sta=
te->stream)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8592) 				remove_stream(adev=
, acrtc, dm_old_crtc_state->stream);
a85ba00538cd4b Nikola Cornij       2021-03-15  8593  =

6ee90e88b97674 hersen wu           2020-07-08  8594  			mode_set_reset_requ=
ired =3D true;
8c322309e48e9f Roman Li            2019-09-20  8595  		}
e7b07ceef2a650 Harry Wentland      2017-08-10  8596  	} /* for_each_crtc_in=
_state() */
e7b07ceef2a650 Harry Wentland      2017-08-10  8597  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8598  	if (dc_state) {
6ee90e88b97674 hersen wu           2020-07-08  8599  		/* if there mode set=
 or reset, disable eDP PSR */
6ee90e88b97674 hersen wu           2020-07-08  8600  		if (mode_set_reset_r=
equired)
6ee90e88b97674 hersen wu           2020-07-08  8601  			amdgpu_dm_psr_disab=
le_all(dm);
6ee90e88b97674 hersen wu           2020-07-08  8602  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8603  		dm_enable_per_frame_=
crtc_master_sync(dc_state);
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  8604  		mutex_lock(&dm->dc_l=
ock);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8605  		WARN_ON(!dc_commit_s=
tate(dm->dc, dc_state));
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  8606  		mutex_unlock(&dm->dc=
_lock);
fa2123dbccdc88 Mikita Lipski       2017-10-17  8607  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8608  =

0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8609) 	for_each_new_crtc_in_=
state(state, crtc, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8610  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
b830ebc910f641 Harry Wentland      2017-07-26  8611  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8612) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8613  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8614) 		if (dm_new_crtc_stat=
e->stream !=3D NULL) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8615  			const struct dc_str=
eam_status *status =3D
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8616) 					dc_stream_get_sta=
tus(dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8617  =

eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8618  			if (!status)
09f609c34fc8b9 Leo Li              2018-11-27  8619  				status =3D dc_stre=
am_get_status_from_state(dc_state,
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8620  									 dm_new_crtc_=
state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8621  			if (!status)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8622) 				DC_ERR("got no sta=
tus for stream %p on acrtc%p\n", dm_new_crtc_state->stream, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8623  			else
e7b07ceef2a650 Harry Wentland      2017-08-10  8624  				acrtc->otg_inst =
=3D status->primary_otg_inst;
e7b07ceef2a650 Harry Wentland      2017-08-10  8625  		}
e7b07ceef2a650 Harry Wentland      2017-08-10  8626  	}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8627  #ifdef CONFIG_DRM_AMD_=
DC_HDCP
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8628  	for_each_oldnew_conne=
ctor_in_state(state, connector, old_con_state, new_con_state, i) {
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8629  		struct dm_connector_=
state *dm_new_con_state =3D to_dm_connector_state(new_con_state);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8630  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(dm_new_con_state->base.crtc);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8631  		struct amdgpu_dm_con=
nector *aconnector =3D to_amdgpu_dm_connector(connector);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8632  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8633  		new_crtc_state =3D N=
ULL;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8634  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8635  		if (acrtc)
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8636  			new_crtc_state =3D =
drm_atomic_get_new_crtc_state(state, &acrtc->base);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8637  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8638  		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8639  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8640  		if (dm_new_crtc_stat=
e && dm_new_crtc_state->stream =3D=3D NULL &&
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8641  		    connector->state=
->content_protection =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8642  			hdcp_reset_display(=
adev->dm.hdcp_workqueue, aconnector->dc_link->link_index);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8643  			new_con_state->cont=
ent_protection =3D DRM_MODE_CONTENT_PROTECTION_DESIRED;
97f6c91787d9fc Bhawanpreet Lakha   2019-09-26  8644  			dm_new_con_state->u=
pdate_hdcp =3D true;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8645  			continue;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8646  		}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8647  =

0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8648  		if (is_content_prote=
ction_different(new_con_state, old_con_state, connector, adev->dm.hdcp_work=
queue))
b1abe5586ffcb1 Bhawanpreet Lakha   2019-08-28  8649  			hdcp_update_display(
b1abe5586ffcb1 Bhawanpreet Lakha   2019-08-28  8650  				adev->dm.hdcp_work=
queue, aconnector->dc_link->link_index, aconnector,
23eb41917fc9f2 Bhawanpreet Lakha   2019-08-29  8651  				new_con_state->hdc=
p_content_type,
0e86d3d4fc5233 Yang Li             2021-02-18  8652  				new_con_state->con=
tent_protection =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8653  	}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8654  #endif
e7b07ceef2a650 Harry Wentland      2017-08-10  8655  =

02d6a6fcdf68c4 David Francis       2018-12-18  8656  	/* Handle connector s=
tate changes */
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8657) 	for_each_oldnew_conne=
ctor_in_state(state, connector, old_con_state, new_con_state, i) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8658) 		struct dm_connector_=
state *dm_new_con_state =3D to_dm_connector_state(new_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8659) 		struct dm_connector_=
state *dm_old_con_state =3D to_dm_connector_state(old_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8660) 		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(dm_new_con_state->base.crtc);
263a4febd1cce6 Anson Jacob         2021-02-18  8661  		struct dc_surface_up=
date dummy_updates[MAX_SURFACES];
19afd79951e630 Nathan Chancellor   2019-02-01  8662  		struct dc_stream_upd=
ate stream_update;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8663  		struct dc_info_packe=
t hdr_packet;
e7b07ceef2a650 Harry Wentland      2017-08-10  8664  		struct dc_stream_sta=
tus *status =3D NULL;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8665  		bool abm_changed, hd=
r_changed, scaling_changed;
e7b07ceef2a650 Harry Wentland      2017-08-10  8666  =

263a4febd1cce6 Anson Jacob         2021-02-18  8667  		memset(&dummy_update=
s, 0, sizeof(dummy_updates));
19afd79951e630 Nathan Chancellor   2019-02-01  8668  		memset(&stream_updat=
e, 0, sizeof(stream_update));
19afd79951e630 Nathan Chancellor   2019-02-01  8669  =

44d09c6a577c8e Harry Wentland      2018-03-15  8670  		if (acrtc) {
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8671) 			new_crtc_state =3D =
drm_atomic_get_new_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8672  			old_crtc_state =3D =
drm_atomic_get_old_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8673  		}
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8674) =

e7b07ceef2a650 Harry Wentland      2017-08-10  8675  		/* Skip any modesets=
/resets */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8676) 		if (!acrtc || drm_at=
omic_crtc_needs_modeset(new_crtc_state))
e7b07ceef2a650 Harry Wentland      2017-08-10  8677  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8678  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8679) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8680  		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8681  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8682  		scaling_changed =3D =
is_scaling_state_different(dm_new_con_state,
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8683  							     dm_old_con=
_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8684  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8685  		abm_changed =3D dm_n=
ew_crtc_state->abm_level !=3D
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8686  			      dm_old_crtc_s=
tate->abm_level;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8687  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8688  		hdr_changed =3D
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8689  			is_hdr_metadata_dif=
ferent(old_con_state, new_con_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8690  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8691  		if (!scaling_changed=
 && !abm_changed && !hdr_changed)
c1ee92f94ce3b9 David Francis       2018-11-26  8692  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8693  =

b6e881c947417e Dmytro Laktyushkin  2019-09-13  8694  		stream_update.stream=
 =3D dm_new_crtc_state->stream;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8695  		if (scaling_changed)=
 {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8696) 			update_stream_scali=
ng_settings(&dm_new_con_state->base.crtc->mode,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  8697  					dm_new_con_state,=
 dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8698  =

02d6a6fcdf68c4 David Francis       2018-12-18  8699  			stream_update.src =
=3D dm_new_crtc_state->stream->src;
02d6a6fcdf68c4 David Francis       2018-12-18  8700  			stream_update.dst =
=3D dm_new_crtc_state->stream->dst;
02d6a6fcdf68c4 David Francis       2018-12-18  8701  		}
02d6a6fcdf68c4 David Francis       2018-12-18  8702  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8703  		if (abm_changed) {
02d6a6fcdf68c4 David Francis       2018-12-18  8704  			dm_new_crtc_state->=
stream->abm_level =3D dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8705  =

02d6a6fcdf68c4 David Francis       2018-12-18  8706  			stream_update.abm_l=
evel =3D &dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8707  		}
70e8ffc55b98f3 Harry Wentland      2017-11-10  8708  =

b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8709  		if (hdr_changed) {
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8710  			fill_hdr_info_packe=
t(new_con_state, &hdr_packet);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8711  			stream_update.hdr_s=
tatic_metadata =3D &hdr_packet;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8712  		}
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8713  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8714) 		status =3D dc_stream=
_get_status(dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8715  		WARN_ON(!status);
3be5262e353b8a Harry Wentland      2017-07-27  8716  		WARN_ON(!status->pla=
ne_count);
e7b07ceef2a650 Harry Wentland      2017-08-10  8717  =

02d6a6fcdf68c4 David Francis       2018-12-18  8718  		/*
02d6a6fcdf68c4 David Francis       2018-12-18  8719  		 * TODO: DC refuses =
to perform stream updates without a dc_surface_update.
02d6a6fcdf68c4 David Francis       2018-12-18  8720  		 * Here we create an=
 empty update on each plane.
02d6a6fcdf68c4 David Francis       2018-12-18  8721  		 * To fix this, DC s=
hould permit updating only stream properties.
02d6a6fcdf68c4 David Francis       2018-12-18  8722  		 */
02d6a6fcdf68c4 David Francis       2018-12-18  8723  		for (j =3D 0; j < st=
atus->plane_count; j++)
263a4febd1cce6 Anson Jacob         2021-02-18  8724  			dummy_updates[j].su=
rface =3D status->plane_states[0];
98e6436d3af5fe Anthony Koo         2018-08-21  8725  =

02d6a6fcdf68c4 David Francis       2018-12-18  8726  =

02d6a6fcdf68c4 David Francis       2018-12-18  8727  		mutex_lock(&dm->dc_l=
ock);
02d6a6fcdf68c4 David Francis       2018-12-18  8728  		dc_commit_updates_fo=
r_stream(dm->dc,
263a4febd1cce6 Anson Jacob         2021-02-18  8729  						     dummy_updat=
es,
3be5262e353b8a Harry Wentland      2017-07-27  8730  						     status->pla=
ne_count,
02d6a6fcdf68c4 David Francis       2018-12-18  8731  						     dm_new_crtc=
_state->stream,
263a4febd1cce6 Anson Jacob         2021-02-18  8732  						     &stream_upd=
ate,
263a4febd1cce6 Anson Jacob         2021-02-18  8733  						     dc_state);
02d6a6fcdf68c4 David Francis       2018-12-18  8734  		mutex_unlock(&dm->dc=
_lock);
e7b07ceef2a650 Harry Wentland      2017-08-10  8735  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8736  =

b5e83f6fe1f003 Nicholas Kazlauskas 2019-04-08  8737  	/* Count number of ne=
wly disabled CRTCs for dropping PM refs later. */
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8738) 	for_each_oldnew_crtc_=
in_state(state, crtc, old_crtc_state,
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8739) 				      new_crtc_sta=
te, i) {
fe2a19652918a5 Lyude Paul          2018-06-21  8740  		if (old_crtc_state->=
active && !new_crtc_state->active)
fe2a19652918a5 Lyude Paul          2018-06-21  8741  			crtc_disable_count+=
+;
fe2a19652918a5 Lyude Paul          2018-06-21  8742  =

54d76575246798 Leo (Sunpeng  Li    2017-10-12  8743) 		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8744) 		dm_old_crtc_state =
=3D to_dm_crtc_state(old_crtc_state);
66b0c973d7f74e Mario Kleiner       2019-03-29  8745  =

585d450c76d1d5 Aurabindo Pillai    2020-08-12  8746  		/* For freesync conf=
ig update on crtc state and params for irq */
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8747  		update_stream_irq_pa=
rameters(dm, dm_new_crtc_state);
057be086603feb Nicholas Kazlauskas 2019-04-15  8748  =

66b0c973d7f74e Mario Kleiner       2019-03-29  8749  		/* Handle vrr on->of=
f / off->on transitions */
66b0c973d7f74e Mario Kleiner       2019-03-29  8750  		amdgpu_dm_handle_vrr=
_transition(dm_old_crtc_state,
66b0c973d7f74e Mario Kleiner       2019-03-29  8751  						dm_new_crtc_stat=
e);
e7b07ceef2a650 Harry Wentland      2017-08-10  8752  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8753  =

8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8754  	/**
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8755  	 * Enable interrupts =
for CRTCs that are newly enabled or went through
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8756  	 * a modeset. It was =
intentionally deferred until after the front end
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8757  	 * state was modified=
 to wait until the OTG was on and so the IRQ
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8758  	 * handlers didn't ac=
cess stale or invalid state.
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8759  	 */
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8760  	for_each_oldnew_crtc_=
in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8761  		struct amdgpu_crtc *=
acrtc =3D to_amdgpu_crtc(crtc);
8e7b6fee9b03d6 Wayne Lin           2021-02-09  8762  #ifdef CONFIG_DEBUG_FS
86bc221918925a Wayne Lin           2021-03-02  8763  		bool configure_crc =
=3D false;
8e7b6fee9b03d6 Wayne Lin           2021-02-09  8764  		enum amdgpu_dm_pipe_=
crc_source cur_crc_src;
8e7b6fee9b03d6 Wayne Lin           2021-02-09  8765  #endif
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8766  		dm_new_crtc_state =
=3D to_dm_crtc_state(new_crtc_state);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8767  =

8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8768  		if (new_crtc_state->=
active &&
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8769  		    (!old_crtc_state=
->active ||
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8770  		     drm_atomic_crtc=
_needs_modeset(new_crtc_state))) {
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8771  			dc_stream_retain(dm=
_new_crtc_state->stream);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8772  			acrtc->dm_irq_param=
s.stream =3D dm_new_crtc_state->stream;
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  8773  			manage_dm_interrupt=
s(adev, acrtc, true);
e2881d6d0a2653 Rodrigo Siqueira    2021-01-07  8774  =


:::::: The code at line 8466 was first introduced by commit
:::::: 7578ecda14d521f39e74166103270c62b15af96d drm/amd/display: make a bun=
ch of stuff in amdgpu_dm.c static

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1402356652040590372==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Gygr70lBNK12SPkfx9fqILBFAQA=
--===============1402356652040590372==--

